# **Getting Started with 4ZeroBox Mobile**

### **Unboxing Time!**

Inside the box, you will find the 

*  4Zerobox Mobile
*  Antennas
*  DIN Rail compatibile-packaging
*  Warnings and instructions manual

<figure>
  <a data-fancybox="gallery" href="../img/unbox_4zb.png">
  <img src="../img/unbox_4zb.png"width="600" />
  </a>
</figure>



### **1. Create a project**

First, you need to install the Zerynth SDK, [Here is a step-by-step guide for installing Zerynth SDK for windows, linux or mac.](sdk_guide.md)


Let's create a new project, you can create a new project from scratch by pressing `Ctrl+Shift+P` and entering the command `New Zerynth project`.
Zerynth SDK also provides a lot of examples that can be easily cloned and used as a starting point for a new project.

Just press `Ctrl+Shift+P` and type `examples` in the popup that VSCode displays.

<figure>
  <a data-fancybox="gallery" href="../img/example.jpg">
  <img src="../img/example.jpg" />
  </a>
</figure>

Simply choose `Zerynth > Search examples` and then type `Hello`. Select the `Hello_4Zerobox_Mobile` example and provide a folder to clone in. When ready, click `Clone Zerynth Example` and you are good to go.

### **2. Connect and configure the 4ZeroBox**

Connect the 4ZeroBox Mobile to the PC. The VSCode extension provides a panel labeled *Zerynth Control Panel* that contains information about the current project.

Press *Physical Device* and if necessary, the extension will ask which board is connected.

<figure>
  <a data-fancybox="gallery" href="../img/control_panel_no_device.jpg">
  <img src="../img/control_panel_no_device.jpg" />
  </a>
  <figcaption>Control Panel before selecting the physical device</figcaption>
</figure>

<figure>
  <a data-fancybox="gallery" href="../img/control_panel_with_4zb_mobile.jpg">
  <img src="../img/control_panel_with_4zb_mobile.jpg" />
  </a>
  <figcaption>Control Panel after selecting the physical device</figcaption>
</figure>


### **3. Run the example**

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The Zerynth SDK compiles the source files, creates a binary firmware and burns it to the ZM1-DB.

After the compilation and flashing, the terminal should show the serial output "Hello from 4ZeroBox Mobile!"

### **4. Connect to the cloud over cellular network**


the 4Zerobox handles cellular connectivity seamlessly, just **claim** the device and the extension automatically connects the board to the cloud device, generates and shows cellular information like: MSISDN, IMSI, Modem IMEI and more.


Insert Zerynth sim in the SIM slot beside the antennas and click on **claim device**, this process must be done only once, it's just a click and gives you control over the device forever (or until you decide otherwise).

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
if you click on *cloud device* section, you will be directed to the device page in zerynth cloud.

<figure>
  <a data-fancybox="gallery" href="../img/after_prov_4zb_mob.jpg">
  <img src="../img/after_prov_4zb_mob.jpg" />
  </a>
  <figcaption>4ZeroBox mobile claimed</figcaption>
</figure>

The next step is to clone *Publish over cellular* example, from the examples tab on the left, clone the example.


After cloning, click on **Physical device** to configure the code for the 4zerobox mobile.
the extension imports all necessary libraries and configures the code to connect to zerynth cloud servers.

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The Zerynth SDK compiles the source files, creates a binary firmware and burns it.

The terminal should state the connection status and if connected successfuly should print data similar to this output

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
  <a data-fancybox="gallery" href="../img/after_connection_4zb_mobile.jpg">
  <img src="../img/after_connection_4zb_mobile.jpg" />
  </a>
</figure>

To see the recieved data, go to the *console* section in your device page in Zerynth Cloud.

<figure>
  <a data-fancybox="gallery" href="../img/console_section_zerynth_cloud.jpg">
  <img src="../img/console_section_zerynth_cloud.jpg" />
  </a>
</figure>

### **5. Hardware details**

If you want more information on the features, pinmap or the user manual, Please refer to [the hardware page.](../../hardware/4ZeroBox_mobile/)

### **6. Explore Zerynth!**
Zerynth can do much more ! For additional examples check:

- The examples tab in Zerynth extension.
- [The tutorials section](../../tutorials/)
