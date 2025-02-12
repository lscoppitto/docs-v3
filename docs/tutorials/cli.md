# Command Line Interface


In this tutorial we will show how to use Zerynth toolchain from the command line for building and running a simple IoT project.

The tutorial assumes:

- You have a supported [hardware](../hardware/index.md) at hand
- You have installed the [Zerynth SDK](../gettingstarted/sdk_guide.md)


## Shells and editors

A command line interface toolchain is built to be run in a shell. There are so many shells out there that covering all of them is daunting. Luckily they almost share the same standard interface and for the sake of this tutorial let's reasonably assume that you have some flavour of `bash`, `zsh` (for Linux and Mac) or `powershell` (for Windows).

For Windows you can find Powershell in the start menu while for Mac you can install [iTerm2](https://iterm2.com/)

<figure>
  <a data-fancybox="gallery" href="../img/cli-01.png">
  <img src="../img/cli-01.png" />
  </a>
  <figcaption>Windows Powershell</figcaption>
</figure>

Fire up a terminal and type the command `ztc`. If everything has been installed correctly you should see the following output:

<figure>
  <a data-fancybox="gallery" href="../img/cli-02.png">
  <img src="../img/cli-02.png" />
  </a>
  <figcaption>ztc output</figcaption>
</figure>

`ztc` is the command line toolchain of the Zerynth SDK. As you can see from the help message, it can perform all the operations required for developing an IoT project.

Commands are given as parameters to `ztc`. For example, let's type 
```bash
ztc info
```
 and look at the result.

<figure>
  <a data-fancybox="gallery" href="../img/cli-03.png">
  <img src="../img/cli-03.png" />
  </a>
  <figcaption>ztc info output</figcaption>
</figure>

`ztc` printed the version of the sdk.


You will also need an editor to write and modify code. Again there are plenty of editors, you can use the one you prefer.


## An IoT project

Let's develop a simple IoT project completely from the command line.


### Create the project

First thing, let's create a project. For avoiding messing up a tidy filesystem, let's first create a temporary folder to save our projects into.

In the terminal type `mkdir ztutorials` and then `cd ztutorials`. Whatever the shell, this two commands create a folder named `ztutorials` and move inside it.


Now type  
```bash
ztc project create tutorial-cli
```
The project `tutorial-cli` is created and some files are copied inside. Those files can be displayed in the terminal by first typing `cd tutorial-cli` for moving inside the project and then typing `ls`.

<figure>
  <a data-fancybox="gallery" href="../img/cli-04.png">
  <img src="../img/cli-04.png" />
  </a>
  <figcaption>Project creation</figcaption>
</figure>

The files in projects are:

- `main.py`, the source code of the project
- `config.yml`, the project configuration file
- `resources`, a folder that will be copied in the internal filesystem of the device to populate it


### Editing Code

You can now open the `main.py` file and look at the code. By default it's a simple `Hello World`:

```python
###############################################################################
# Hello Zerynth
###############################################################################

# Welcome to the first and simplest Zerynth example.
# Let's just loop forever by printing something to the standard output,
# in this case, the USB serial port (open the device console to view the output)

# loop forever
while True:
    # print something
    print("Hello Zerynth!")
    # sleep 1 second
    sleep(1000)

```

Let's modify it with this:

```python linenums="1"
################################################################################
# ZDM Simple
################################################################################

from bsp import board
from zdm import zdm
from networking import wifi

# Set the ssid and password of your wifi network
ssid = "your-ssid"
passwd = "your-password"

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

In the editor modify the `ssid` and `password` variables at lines 10-11 with your network name and password.


### Configure the project

The project is almost ready to be run. We still need to configure it for the Zerynth hardware you are going to use.

First, let's see what kind of hardware it is. Plug it in the USB and type 
```bash
ztc device discover
```

<figure>
  <a data-fancybox="gallery" href="../img/cli-05.png">
  <img src="../img/cli-05.png" />
  </a>
  <figcaption>ztc device discover</figcaption>
</figure>


That's a lot of information! Notice that `ztc` recognized the hardware as a `4zerobox_v9`. However, all you need to go on is the `uid`. It basically is a hardware identifier that allows the
Zerynth SDK to interact with the device you just plugged into the USB. Keep note of the `uid` (in our case `b08a15d393e42ed94f38145dfbd48a628f9ca30b` because it will be needed in the next command.

Type 
```bash
ztc project update --uid b08a15d393e42ed94f38145dfbd48a628f9ca30b --board 4zerobox_v9
```

This configure the project for our specific hardware.
Note that the option `--board` is not really needed because the SDK already recognized the device. However, there might be cases when this will not happen (i.e. multiple devices connected), so it's a good habit to always specify the board.


### Build and Run


Now that the project is configured, it's time to run it! Let's type 
```bash
ztc compile
```
 to verify that the project code has no errors.

<figure>
  <a data-fancybox="gallery" href="../img/cli-06.png">
  <img src="../img/cli-06.png" />
  </a>
  <figcaption>ztc compile</figcaption>
</figure>

Again, that's a lot of information, but all you need is that the file `firmware.z` has been saved correcty. `firmware.z` is compressed archive
that contains all the files required to run a project on a Zerynth hardware. 

After compilation it contains just some binary files and the [zOS](../reference/os/index.md). We need another step before having a real executable. Let's type 

```bash
ztc link ./build/firmware.z
```

Now `firmware.z` also contains an executable version of the project ready to be run!

Let's type 
```bash
ztc device burn b08a15d393e42ed94f38145dfbd48a628f9ca30b ./build/firmware.z
```

This takes the executable in `firmware.z` and copies it into te device identified by the `uid`.


Type the command 
```bash
ztc device console b08a15d393e42ed94f38145dfbd48a628f9ca30b
```
 and check the output of the project.

<figure>
  <a data-fancybox="gallery" href="../img/cli-07.png">
  <img src="../img/cli-07.png" />
  </a>
  <figcaption>Console with MQTT errors</figcaption>
</figure>

As you can see, there are errors, because the device is not yet recognized by the Zerynth Cloud. You have a device, not yet an IoT device!
In order to connect it properly and securely, let's go on with the tutorial, but first press `Ctrl+c` to stop receiving the output from the device.


### Provisioning

Now that the project is running is time to make it connected. Enter the `zdm`! Yes, `zdm` is another toolchain for managing the device access and behaviour to the Zerynth Cloud. 

Devices are organized in fleets (group of devices) and fleets live under a workspace. The first time you created a Zerynth account, a default workspace and a default fleet have been created.

Just type 
```bash
zdm workspace ls
```
 to list your workspaces. Take note of the workspace id (in our case `wks-4tqb61zth8ug`) then type 
```bash
zdm fleet ls wks-4tqb61zth8ug
```
 and take not of your fleet also (in our case `flt-4tqb622bdlah`).

<figure>
  <a data-fancybox="gallery" href="../img/cli-08.png">
  <img src="../img/cli-08.png" />
  </a>
  <figcaption>zdm commands</figcaption>
</figure>

Armed with workspace and fleet you can create our first cloud device!

Type 
```bash
zdm device create wks-4tqb61zth8ug flt-4tqb622bdlah Zerynth
```
 and a new device named `Zerynth` with identifier `dev-5urjl32twpyv` is born.

Now you just need to associate your physical device connected to the USB with the newly created cloud device. This bonding will let the project connect to the Zerynth Cloud and the device being authenticated.

This step is called *provisioning* in the IoT jargon and it's quite complex. Let's do it step by step.

First you need the device credentials stored in the secure element. To do so, you need to load a provisioning firmware.
Let's do it with 
```bash
ztc device provision prepare b08a15d393e42ed94f38145dfbd48a628f9ca30b
```
This loads the firmware enabling you to send commands to retrieve various things.

For associating a physical device to the cloud device you need a `bundle`. It is basically the signature of the current timestamp and device identity with the device private key held in the secure element. The `bundle` allows the Zerynth Cloud to verify that your Zerynth hardware is original and manufactured by us.

Let's get the bundle with 
```bash
ztc device provision command b08a15d393e42ed94f38145dfbd48a628f9ca30b bundle
```


Note the bundle down and let's get back to the `zdm` for the association: 
```bash
zdm device identity create wks-4tqb61zth8ug dev-5urjl32twpyv the-bundle-from-previous-command
```

<figure>
  <a data-fancybox="gallery" href="../img/cli-09.png">
  <img src="../img/cli-09.png" />
  </a>
  <figcaption>zdm provisioning</figcaption>
</figure>


And done! The physical device is now cryptographically linked to the cloud device.

Let's run the project again with 
```bash
ztc device burn b08a15d393e42ed94f38145dfbd48a628f9ca30b ./build/firmware.z
```
 because it has been overwritten by the provisioning step.
If you now type again 
```bash
ztc device console b08a15d393e42ed94f38145dfbd48a628f9ca30b
```
 the serial log will show that the device is connected to the Zerynth Cloud.

<figure>
  <a data-fancybox="gallery" href="../img/cli-10.png">
  <img src="../img/cli-10.png" />
  </a>
  <figcaption>working project</figcaption>
</figure>


### Device management

Now that the IoT device is connected, it can be controlled and updated remotely with the toolchain.

Let's send a job to the device. A job is a request that comes from the cloud and that the device executes. By default, all devices can handle the `reset` job that, as the name implies, causes a soft reset of the device.

The command to type is

```bash
zdm job schedule "reset" dev-5urjl32twpyv --arg value " "
```

it sends the reset request with an empty argument to the device that after a small delay, reset itself.

Remote controlling is very useful expecially for updating the firmware. As the last step of this tutorial let's perform an over the air update (FOTA).

What you need is a linked firmware, namely a working `firmware.z` and you already have one in the build folder. You also need to create a firmware in the cloud and upload the `firmware.z` to it. A cloud firmware is a container for multiple versions of the same project.

So, to create a firmware just type 
```bash
zdm workspace firmware wks-4tqb61zth8ug create tutorial-cli
```

the new firmware is named `tutorial-cli` and has `fmw-5us79pzw429k` as identifier.

Let's upload the `firmware.z` to the newly created firmware with 

```bash
zdm workspace firmware wks-4tqb61zth8ug upload fmw-5us79pzw429k v1 ./build/firmware.z
```


It's a long command, but basically takes the executable parts of `firmware.z` and uploads them to the cloud under the `fmw-5us79pzw429k` container assigning version `v1`. 
Once the new firmware is safely stored on the cloud, it can be sent to the device (or to fleets for bulk updates).

Type 

```bash
zdm fota schedule dev-5urjl32twpyv fmw-5us79pzw429k v1
```

to send the version `v1` of the `tutorial-cli` firmware.

FOTA can take some time, just type 
```bash
ztc device console b08a15d393e42ed94f38145dfbd48a628f9ca30b
```

and follow the log!


