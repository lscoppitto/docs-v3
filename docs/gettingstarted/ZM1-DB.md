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


First, you need to install the Zerynth SDK, [Here is a step-by-step guide for installing Zerynth SDK for windows, linux or mac.](sdk_guide.md)

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

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The Zerynth SDK compiles the source files, creates a binary firmware and burns it to the board.

Just press *Console* and the serial output of ZM1-DB will appear in the VSCode terminal.

### **4. Connect to the cloud**

Connecting your devices to the cloud is very easy with zerynth platform. You don't need to have technical knowledge about protocols or certificates, in minutes you will be sending your data to the cloud securely.

To connect your device to the cloud, you have to **claim** it. It must be done only once, it's just a click and gives you control over the device forever (or until you decide otherwise by pressing **unclaim**).

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
if you click on *cloud device* section, you will be directed to the device page in zerynth cloud.

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

Change the *ssid* and *passwd* in the code according to your wifi network settings, choose the hardware type from the *Zerynth control panel* and then Run the code. 

The terminal should state the connection status.
Let's click on the *cloud device* in the *zerynth control panel* to check the device status.

<figure>
  <a data-fancybox="gallery" href="../img/after_connection.jpg">
  <img src="../img/after_connection.jpg" />
  </a>
</figure>

To see the recieved data, go to the *console* section in your device page in Zerynth Cloud.


### **5. Hardware details**

If you want more information on the features, pinmap or the user manual, Please refer to [the hardware page.](../../hardware/ZM1-Development-Board/)

### **6. Explore the ZM1-DB**

Zerynth can do much more than a simple Hello World, for additional examples refer to:

- The examples tab in Zerynth extension.
- [Tutorials](../tutorials/index.md)
