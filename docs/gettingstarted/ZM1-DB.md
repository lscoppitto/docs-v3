# **Getting Started with ZM1-Development Board**

<figure>
  <a data-fancybox="gallery" href="../img/zm1-db.png">
  <img src="../img/zm1-db.png"width="250" />
  </a>
</figure>


### **Unboxing Time!**

Inside the box, you will find the 

*  ZM1-DB
*  Sticker for the DIN rail mountable case
*  Warnings and instructions manual


### **1. Create a project**


First, you need to install the Zerynth SDK, [Here is a step-by-step guide for installing Zerynth SDK for Windows, Linux or Mac.](sdk_guide.md)

Let's create a new project, you can create a new project from scratch by pressing `Ctrl+Shift+P` and entering the command `New Zerynth project`.
Zerynth SDK also provides a lot of examples that can be easily cloned and used as a starting point for a new project.

Just press `Ctrl+Shift+P` and type `examples` in the popup that VSCode displays.

<figure>
  <a data-fancybox="gallery" href="../img/example.jpg">
  <img src="../img/example.jpg" />
  </a>
</figure>

Simply choose `Zerynth > Search examples` and then type `Hello`. Select the `Hello_Zerynth` example and provide a folder to clone in. When ready, click `Clone Zerynth Example` and you are good to go.

### **2. Connect and configure the ZM1-DB**

Connect the ZM1-DB with a USB-C cable to the PC. The VSCode extension provides a panel labeled *Zerynth Control Panel* that contains information about the current project.

Press *Physical Device* and if necessary, the extension will ask which board is connected.

<figure>
  <a data-fancybox="gallery" href="../img/control_panel_no_device.jpg">
  <img src="../img/control_panel_no_device.jpg" />
  </a>
  <figcaption>Control Panel before selecting the physical device</figcaption>
</figure>

<figure>
  <a data-fancybox="gallery" href="../img/control_panel_with_device.jpg">
  <img src="../img/control_panel_with_device.jpg" />
  </a>
  <figcaption>Control Panel after selecting the physical device</figcaption>
</figure>

### **3. Run the example**

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The Zerynth SDK compiles the source files, creates a binary firmware, and burns it to the board.

Just press *Console* and the serial output of ZM1-DB will appear in the VSCode terminal.

### **4. Connect to the cloud**

Connecting your devices to the cloud is very easy with zerynth platform. You don't need to worry about protocols or certificates, in minutes you will be sending your data to the cloud securely.

To connect your device to the cloud, you have to **claim** it. It must be done only once, it's just a click and gives you control over the device forever (or until you decide otherwise by pressing **unclaim**).

If you have attached a cellular expansion module like the EXP-Connect the SDK will [claim the device and the SIM card as cellular devices](#claiming-as-cellular-connected-device), if not the device will be claimed as a wifi-based device.
Either way, the process is similar and is automatically determined by the extension.

#### Claiming as Wi-Fi-connected device
Just click *claim device* in the Zerynth Control Panel. You will be asked to 

*  choose which fleet you want to register your device to.

<figure>
  <a data-fancybox="gallery" href="../img/provision1.jpg">
  <img src="../img/provision1.jpg" />
  </a>
</figure>

*  Create a new cloud device for this board.
*  Accept the provisioning firmware (the existing firmware will be overwritten).
*  After provisioning, the terminal should print "Claim finished successfully".
if you click on the *cloud device* section, you will be directed to the device page in zerynth cloud.

<figure>
  <a data-fancybox="gallery" href="../img/after_prov.jpg">
  <img src="../img/after_prov.jpg" />
  </a>
</figure>

The next step is to clone *ZDM_simple* example, from the examples tab on the left, clone the ZDM simple example..
<figure>
  <a data-fancybox="gallery" href="../img/zdm_simple.jpg">
  <img src="../img/zdm_simple.jpg" />
  </a>
</figure>

Change the *ssid* and *passwd* in the code according to your wifi network settings, choose the hardware type from the *Zerynth control panel* and then run the code. 

The terminal should state the connection status.
Let's click on the *cloud device* in the *zerynth control panel* to check the device status.

<figure>
  <a data-fancybox="gallery" href="../img/after_connection.jpg">
  <img src="../img/after_connection.jpg" />
  </a>
</figure>

To see the received data, go to the *console* section in your device page in Zerynth Cloud.

#### Claiming as cellular-connected device

Insert the zerynth sim card in the sim slot beside the antennas and click on **claim device** on the zerynth control panel, 

during the **claim device** process You will be asked to 

*  choose which fleet you want to register your device to.

<figure>
  <a data-fancybox="gallery" href="../img/provision1.jpg">
  <img src="../img/provision1.jpg" />
  </a>
</figure>

*  Create a new cloud device for this board.
*  Accept the provisioning firmware (the existing firmware will be overwritten).
*  After provisioning, the terminal should output "Claim finished successfully".
if you click on the *cloud device* section, you will be directed to the device page in zerynth cloud.

<figure>
  <a data-fancybox="gallery" href="../img/after_prov_zm1-dd_cellular.jpg">
  <img src="../img/after_prov_zm1-dd_cellular.jpg" />
  </a>
  <figcaption>ZM1-DB mobile claimed</figcaption>
</figure>

The next step is to clone the *cellular Simple* example, from the examples tab on the left, clone the example.


After cloning while the project is opened, click on **Physical device** to configure the code for the ZM1-DB.
the extension imports all necessary libraries and configures the code accordingly.

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The Zerynth SDK compiles the source files, creates a binary firmware ,and burns it.

The terminal should state the connection status and if connected successfully should print data similar to this output

```
INFO ] bsp.board @:101 | Configuring output only gpios...
[INFO ] bsp.board @:105 | Configuring input only gpios...
configuring cellular...
connecting to cellular...
connected! (True, 10.13.134.14, 255.255.255.255, 10.64.64.64, 79.170.208.50, 00:00:00:00:00:00)
www.zerynth.com:  78.46.184.161
[INFO ] zdm.zdm @_run:139 | Starting...
[INFO ] zdm.zdm @_connect:121 | Connecting...
[INFO ] zdm.zdm @_handle_dn_msg:258 | received message {"version":1636557616520,"key":"#status","value":{"current":{"__info":{"t":1636557546027,"v":null}},"expected":{}}}
[INFO ] zdm.zdm @_handle_delta_request:372 | delta request with key status
[INFO ] zdm.zdm @update_clock:287 | Sync time from ts: 1636557616
[INFO ] zdm.zdm @_handle_dn_msg:258 | received message {"version":1636557617255,"key":"#status","value":{"current":{"__info":{"t":1636557616531,"v":null}},"expected":{}}}
[INFO ] zdm.zdm @_handle_delta_request:372 | delta request with key status
[INFO ] zdm.zdm @update_clock:287 | Sync time from ts: 1636557617
cellinfo:  (NOCONN, EDGE, 22201, GSM 900, 8, 44823, 32294, 19, 222, 1, I TIM)
ZDM is online:     True
Firmware version:  Factory
```
Let's click on the *cloud device* in the *zerynth control panel* to check the device status.

<figure>
  <a data-fancybox="gallery" href="../img/Zm1-DB_cloud.jpg">
  <img src="../img/Zm1-DB_cloud.jpg" />
  </a>
</figure>

To see the received data, go to the *console* section in your device page in Zerynth Cloud.

### **5. Hardware details**

If you want more information on the features, pin map, or the user manual, please refer to [the hardware page.](../../hardware/ZM1-Development-Board/)

### **6. Explore the ZM1-DB**

Zerynth can do much more than a simple Hello World, for additional examples refer to:

- The examples tab in Zerynth extension.
- [Tutorials](../tutorials/index.md)
