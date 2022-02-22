# Examples

The following are some examples for the ZDM library.

## ZDM connect and publish


This example shows how to create a ZDM agent, start it and have it send data periodically. 

You can use this example to test ZDM Webhooks and Ubidots integrations.


```main.py```

```python
################################################################################
# ZDM Simple
################################################################################

# The Zerynth Device Manager is the entrypoint for the Zerynth Cloud.
# Let's connect and send data to the ZDM with a simple example.
# Before exeuting this code, please associate the device with your
# ZDM account by selecting "ZDM target" in VSCode Control Panel.

# Let's import the zdm module
from zdm import zdm
# We also need wifi or ethernet
from networking import wifi

# Set the ssid and password of your wifi network
ssid = "your-wifi-network-ssid"
passwd = "your-wifi-password"

while True:

    try:
        # Let's connect to the wifi
        print("configuring wifi...")
        wifi.configure(
            ssid=ssid,
            password=passwd)
        print("connecting to wifi...")
        wifi.start()
        print("connected!",wifi.info())

        # the Agent class implements all the logic to talk with the ZDM
        agent = zdm.Agent()
        # just start it
        agent.start()

        while True:
            # use the agent to publish values to the ZDM
            # Just open the device page from VSCode and check that data is incoming
            agent.publish({"value":random(0,100)}, "test")
            sleep(5000)
            # The agent automatically handles connections and reconnections
            print("ZDM is online:    ",agent.online())
            # And provides info on the current firmware version
            print("Firmware version: ",agent.firmware())

        wifi.stop()
        print("disconnected from wifi")
    except WifiBadPassword:
        print("Bad Password")
    except WifiBadSSID:
        print("Bad SSID")
    except WifiException:
        print("Generic Wifi Exception")
    except Exception as e:
        raise e

    sleep(3000)

```
## ZDM Jobs


A basic example showing how to use ZDM jobs. Write your own jobs, then add them in the jobs dictionary with a custom name.

Once the device is connected to the ZDM, jobs can be sent from the ZDM web interface using the custom name.


```main.py```

```python
################################################################################
# ZDM Jobs
################################################################################

# The Zerynth Device Manager is the entrypoint for the Zerynth Cloud.
# Let's connect and send data to the ZDM with a simple example.
# Before exeuting this code, please associate the device with your
# ZDM account by selecting "ZDM target" in VSCode Control Panel.

from bsp import board
# Let's import the zdm module
from zdm import zdm
# We also need wifi or ethernet
from networking import wifi
import gpio


# Set the ssid and password of your wifi network
ssid = "your-wifi-network-ssid"
passwd = "your-wifi-password"


# this is a function callable by the ZDM with a job request.
# Notice that it has two parameters: the ZDM agent that receives the request
# and a dictionary with the arguments of the job.
# Color just switches the onboard RGB led to the value set in the job request
def color(agent, args):
    print("Job request received!",args)
    c = args["color"]
    if c=="red":
        gpio.set(LED_GREEN,1)
        gpio.set(LED_BLUE,1)
        gpio.set(LED_RED,0)
    elif c=="green":
        gpio.set(LED_GREEN,0)
        gpio.set(LED_BLUE,1)
        gpio.set(LED_RED,1)
    elif c=="blue":
        gpio.set(LED_GREEN,1)
        gpio.set(LED_BLUE,0)
        gpio.set(LED_RED,1)
    else:
        gpio.set(LED_GREEN,1)
        gpio.set(LED_BLUE,1)
        gpio.set(LED_RED,1)


while True:

    try:
        # Let's connect to the wifi
        print("configuring wifi...")
        wifi.configure(
            ssid=ssid,
            password=passwd)
        print("connecting to wifi...")
        wifi.start()
        print("connected!",wifi.info())

        # the Agent class implements all the logic to talk with the ZDM
        # it also accepts a dictionary of functions to be called as jobs
        agent = zdm.Agent(jobs={"color":color})
        # just start it
        agent.start()

        while True:
            # use the agent to publish values to the ZDM
            # Just open the device page from VSCode and check that data is incoming
            v = random(0,100)
            agent.publish({"value":v}, "test")
            print("Published",v)
            sleep(5000)
            # The agent automatically handles connections and reconnections
            print("ZDM is online:    ",agent.online())
            # And provides info on the current firmware version
            print("Firmware version: ",agent.firmware())

        wifi.stop()
        print("disconnected from wifi")
    except WifiBadPassword:
        print("Bad Password")
    except WifiBadSSID:
        print("Bad SSID")
    except WifiException:
        print("Generic Wifi Exception")
    except Exception as e:
        raise e

    sleep(3000)

```

## ZDM FOTA

Connect your device to ZDM and start updating the firmware seamlessly. This example shows how to connect to the Zerynth Device Manager and perform a customized FOTA.

In this example, a FOTA callback function is defined, which is called during the FOTA update steps. The FOTA callback allows you to accept or refuse a FOTA from your devices using the return value. If the callback returns *False* the FOTA update step is accepted, if the callback return something else 
the step is refused

```main.py```

```python
################################################################################
# ZDM FOTA
################################################################################

# Let's import the zdm module
from zdm import zdm
# We also need wifi or ethernet
from networking import wifi

# Set the ssid and password of your wifi network
ssid = "your-wifi-network-ssid"
passwd = "your-wifi-password"

# this function will be called during fota steps
def fota(agent, action, arg):
    if action == "check_version":
        # do not check version, everything is ok
        # just return False to accept a step
        return False
    elif action == "accept":
        # the agent is asking if the current firmware can be accepted
        # or must be refused.
        # Let's try randomly :)
        if random(0,100)%2==0:
            # do not accept fota
            return "random failure"
        else:
            # accept fota
            return False
    # accept any unhandled action
    return False

while True:

    try:
        print("configuring wifi...")
        wifi.configure(
            ssid=ssid,
            password=passwd)
        print("connecting...")
        wifi.start()
        print("connected...")
        print("info...")
        print(wifi.info())
        # set the on_fota callback
        agent = zdm.Agent(on_fota=fota)
        agent.start()

        while True:
            # use the agent to publish values to the ZDM
            # Just open the device page from VSCode and check that data is incoming
            agent.publish({"value":random(0,100)}, "test")
            sleep(5000)
            # The agent automatically handles connections and reconnections
            print("ZDM is online:    ",agent.online())
            # And provides info on the current firmware version
            print("Firmware version: ",agent.firmware())

        wifi.stop()
        print("disconnected...")
    except WifiBadPassword:
        print("Bad Password")
    except WifiBadSSID:
        print("Bad SSID")
    except WifiException:
        print("Generic Wifi Exception")
    except Exception as e:
        raise e

    sleep(3000)
```
