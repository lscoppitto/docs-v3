# Getting Started with ZM1-EVA

In this guide, we will connect the ZM1-EVA, use the Zerynth extension and get you up and running for developing connected and secure IoT applications.
we will be using the [Zerynth SDK](https://docs.zerynth.com/latest/gettingstarted/vscode/) - this includes VSCode with the VSCode Zerynth extension, which is our default development environment.



## 1. Create a project

Before connecting the ZM1-EVA a project must be created. 
Zerynth SDK provides a lot of examples that can be easily cloned and used as a starting point for a new project.

Just press `Ctrl+Shift+P` and type `examples` in the popup that VSCode displays.
<figure>
  <a data-fancybox="gallery" href="../img/clone-hello-zerynth.png">
  <img src="../img/clone-hello-zerynth.png" />
  </a>
</figure>
The popup is the VSCode command palette from which most of the available operations can be launched.
Simply choose `Zerynth > Search examples` and then type `Hello`. Select the `Hello_Zerynth` example and provide a folder to clone it from its repository as shown in the figures below. When ready, click `Clone Zerynth Example` and you are good to go.

<figure>
  <a data-fancybox="gallery" href="../img/example-hello-zerynth.png">
  <img src="../img/example-hello-zerynth.png" />
  </a>
  <figcaption>The Hello Zerynth example</figcaption>
</figure>

## 2. Connect and Enable the device

Connect the ZM1-EVA to the PC. 
To be sure that the ZM1-EVA device support is enabled, press `Ctrl+Shift+P` and search for `Preferences Open User Settings`.
This will open a dialog with two tabs (**User** and **Workspace**). 
Click on the **Expansion** menu item under the "User" tab, you will see a new menu. Click on "Zerynth" item. Ensure that the ZM1-EVA board is enabled.

<figure>
  <a data-fancybox="gallery" href="../img/zm1eva-enabled.png">
  <img src="../img/zm1eva-enabled.png" />
  </a>
  <figcaption>ZM1-EVA enabled</figcaption>
</figure>

The VSCode extension provides a panel labeled *Zerynth Control Panel* that contains information about the current project.

Press *Physical Device* and the Zerynth SDK will automtically recognize the ZM1-EVA and configure the project accordingly.

<figure>
  <a data-fancybox="gallery" href="../img/control_panel_no_device.jpg">
  <img src="../img/control_panel_no_device.jpg" />
  </a>
  <figcaption>Control Panel before selecting the physical device</figcaption>
</figure>


## 3. Run the example

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The Zerynth SDK compiles the source files, creates a binary firmware and moves it into the ZM1-EVA.

Just press *Console* and the serial output of ZM1-EVA will appear in the VSCode terminal.

<figure>
  <a data-fancybox="gallery" href="../img/example-hello-zerynth-console.png">
  <img src="../img/example-hello-zerynth-console.png" />
  </a>
  <figcaption>Hello Zerynth console</figcaption>
</figure>

## Provisioning the device

The first time you connect the device to Zerynth Cloud, you need to provision the device.
You only need to provision your device once for the lifetime of the device.

Just click `Provisioning` on the `Zerynth Control Panel`, you will be asked to create a cloud device, 
give it a name like `my-iot-device` and accept the confirmation dialog and wait a little.

After provisioning, in the control panel, You'll find the cloud device is now assigned an ID.

## 4. Explore Zerynth!

Zerynth can do much more than a simple Hello World, for additional information refer to:

- [Demos](../../tutorials/zm1-db/exp-relay-lamp/)
- [Zerynth Blog](https://www.zerynth.com/blog/)

