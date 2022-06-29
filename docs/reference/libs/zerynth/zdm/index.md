# Getting started

The ZDM library is central to the IoT development with Zerynth and still it is very simple to use. The simplest usage requires just 3 lines of code:

```python
from zdm import zdm

agent = zdm.Agent()
agent.start()

```

The above snippet shows the steps required to enable a ZDM connection:

- import the ZDM module
- create an instance of the Agent class
- start the agent

## Connection
Under the hood a MQTT client is started and a secure connection is established using the device certificates contained in the secure element of every Zerynth hardware.

In order for the connection to be established correctly it is necessary that the physical device has been associated with a ZDM device. This procedure links the physical device identity contained in the secure element to its cloud identity represented by the ZDM device unique identifier. The procedure must be performed just once and can be done both from the [command line](../../../cli/ztc/index.md)  and [VSCode extension](../../../vscode/index.md).

After the connection is established, the `Agent` will update the real time clock to the current time and will try to keep it synchronized. The `Agent` will also take care of the reliability of the connection by automatically retrying to connect in case of network failure.

Upon successful connection, the `Agent` also sends some information on the physical device, like the firmware version and the device type.

## Jobs

Once connected the `Agent` can handle remote requests for *jobs*. A job is a task that is performed by a function in the firmware. It is possible to configure the `Agent` to call a specific function by assigning it to the job name. For example:

```
def job1(agent, arguments):
    return "OK"

def job2(agent, arguments):
    raise IOError

agent = zdm.Agent(jobs={"myjob":job1, "another_job":job2})

```
The above snippet configures the `Agent` to call function `job1` when the `myjob` job is triggered, and `job2` for `another_job`. Notice that the functions have the same signature: the first argument is the instance of the agent, the second is a dictionary containing the arguments of the job.

Jobs are executed by the `Agent` thread and their result is sent to the cloud for reference. If a job fails with an exception, the error is also sent to the cloud for reference.

## Data

The `Agent` is capable of sending raw data points such as sensor readings to the cloud where they are temporarily stored and fed into the various available integrations (i.e. sent to Azure or to the Zerynth Storage for further elaboration). Data is sent in JSON format as a dictionary called `payload` thus allowing for the maximum flexibility. The `payload` is also associated to a `tag`, a label that can be used to better organize IoT data and to easily retrieve it from the cloud.

Sending data is very easy:

```python

agent = zdm.Agent()
agent.start()

agent.publish(payload={"temperature": 25.3, "humidity": 35.2}, tag="room")
```


## Firmware updates

The `Agent` is capable of accepting a FOTA update request and changing the current firmware with a new one. The FOTA process can be customized by adding checks at different steps. The customization point are:
- version check: the firmware can check the new version and decide if the FOTA should proceed or not. For example, a policy that prevents switching to a version older than the current can be easily implemented with this check.
- new firmware acceptance: the new firmware must be accepted as valid to be run at the next reboot. This is a very critical step since accepting a bad firmware could make the device incapable of performing further updated. By default a new firmware is accepted when it is capable of reconnecting to the ZDM, receiving a job request and confirming it. In some use cases these checks can be not enough and some custom logic may be need. For example a diagnostic function can be run to check that the new firmware is still capable of reading all the sensors and controlling the actuators

Configuring the `Agent` for customized FOTA is easy:

```python
def fota_checks(agent, step, arg):
    if step=="check_version":
        # don't care about version, any version is ok
        return False
    elif step=="accept":
        # do not accept any firmware
        return "sorry, firmware not accepted"


agent = zdm.Agent(on_fota=fota_checks)

```
In the snippet above, a function is provided to the `on_fota` parameter. This function will be called multiple times at different steps in the FOTA process. When `fota_checks` returns *None* or something *False* the step is considered valid, whereas when a non truthy value is returned the step is canceled and the return valued is sent to the cloud as the reason for the FOTA failure.


## ZDM Agent

### class Agent
```python
class Agent(cfg=None, jobs={}, set_clock_every=300, on_fota=None, host="zmqtt.zdm.zerynth.com", download_chunk_size=4096)
```

Create an `Agent` instance. The `Agent` class accepts various parameters:

* `cfg` is an instance of the `Config` class detailing the transport connection parameters. It is set to *None* by default using standard parameters.
* `jobs` is a dictionary that defines the ZDM jobs the agent can handle. The keys of the dictionary are strings representing the name of the jobs and the values are functions that are called each time a job is triggered. When set to empty dictionary *{}* the only jobs that can be triggered are `reset` and `fota`.
* `set_clock_every` is the number of seconds after which re-synchronizing the real time clock. If set to zero or negative, clock synchronization is disabled and is up to the firmware to find alternative ways of setting the current time (i.e. by ntp protocol)
* `on_fota` is a function accepting one ore more arguments that will be called at different steps of the FOTA process to validate or refuse the step.
* `host` is the hostname of the ZDM broker, do not change.
* `download_chunk_size` is the size of the chunk used to download the firmware during FOTA process. Default is *4096* bytes.

### method `start`

```python
start(wait_working=10)
```

Start the `Agent`. Since the connection time can be considerable depending on the network status, the method returns either upon successful connection or after a certain amount of time whatever comes first. The amount of time to wait for a working agent can be set in seconds with the `wait_working` parameter.


### method `online`

```python
online()
```

Return *True* if the following conditions are all satisfied:
- the `Agent` is started
- the MQTT connection has been established
- the MQTT client has subscribed to all required topics
- the `Agent` has received the current time

### method `connected`

```python
connected()
```

Return *True* if the MQTT connection has been established and the MQTT client has subscribed to all required topics.


### method `has_time`

```python
has_time()
```

Return *True* if the `Agent` has received the current time.


### method `firmware`

```python
firmware()
```

Return the current firmware version. Version strings have a specific format:
- an optional prefix terminated with a dash
- the firmware id
- a colon
- the firmware id version

When a firmware is loaded into a device manually via the toolchain, the version string is set to "Factory". The firmware id is determined by the ZDM when a new firmware is created while the firmware version can be decided by the user that loads the new version. By default, the new version is equal to the previous one incremented by one.

When the a new firmware is launched and it has not been validate yet, the version is prefixed with "testing-"

### method `publish`

```python
publish(payload, tag="default", timeout=0)
```

Send data contained in `payload` labeling it with `tag`.
This method calls into the underlying MQTT client that is configured by default with a `qos` of one.
The `timeout` specifies the time in milliseconds to wait for an acknowledgement
form the broker when `qos` > 0; when `qos` = 0, the `timeout` is ignored. If
the acknowledgement is not received by the `timeout`, the `MQTTPublishTimeout`
exception is raised.


### method `reset`

```python
reset()
```

Reset the device gracefully by disconnecting the MQTT client, closing network interfaces (i.e. deassociating from WiFi access point) and finally resetting the device. It is used mainly during the FOTA process to start the new firmware but it can also be called externally when there is a need for a clean reset.


### method `get_fota_percentages`

```python
get_fota_percentages()
```

Return a list with the percentages of firmware files downloaded during the FOTA process. The fist element is the percentage of the zOS, the second is the percentage of python bytecode.

## Agent configuration

### class `Config`

```python
Config(
       keepalive=60,
       reconnect_after=5000,
       network_timeout=60000,
       clean_session=True,
       qos_publish=1,
       qos_subscribe=1)
```
Creates a Config instance that set parameters for the connection to the MQTT broker.

In particular, the following parameters are available:

* `keepalive` is the MQTT keepalive timeout, in seconds
* `reconnect_after` is the time after which retrying to connect upon error, in milliseconds.
* ```network_timeout``` is the timeout in milliseconds for network operations like the TCP connect. If no answer is received after the timeout, the operation is aborted.
* `clean_session` is the MQTT clean session flag
* `qos_publish`  is the quality of service when publishing to the MQTT broker
* `qos_subscribe` isthe quality of service when subscribing to the MQTT broker

