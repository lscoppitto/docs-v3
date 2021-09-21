#Davra integration and ZM1-EVA Evaluation Board

In this demo we will look at how to publish data using the ZM1-EVA Evaluation board, create and enable a Davra integration
and send the collected values to a Davra dashboard.

In this tutorial, we will be using:

1.  [Zerynth SDK](https://www.zerynth.com/zsdk/)  - this includes VSCode with the  [VSCode Zerynth extension](https://marketplace.visualstudio.com/items?itemName=zerynth.zerynth3), which is our default development environment.
    
2.  [Zerynth Device Manager](http://zerynth.com/products/software/zdm/) (ZDM) - it helps you register, organize, monitor, and remotely manage IoT devices at scale.
    
3.  ZM1-EVA - Evaluation Board

## 1. Import the Davra project
Connect the ZM1-EVA and PC with a USB Type-C cable, then clone this [GitHub repository](https://github.com/zerynth/davra) 
containing a Zerynth project that configures a ZM1-EVA Evaluation board for sending humidity and temperature readings from a DHT11 to the Zerynth Cloud.

Install and open the Zerynth SDK, press `Ctrl+Shift+P` and search for `Zerynth: Login`; then login to the Zerynth Cloud or create a new account if you don't have one.

To open the project, click on `File -> Open Folder` from the top menu and search for the path of the downloaded GitHub project.



## 2. Enable the device and configure it to send data
To be sure that the ZM1-EVA device support is enabled, press `Ctrl+Shift+P` and search for `Preferences Open User Settings`.
This will open a dialog with two tabs (**User** and **Workspace**). 
Click on the **Expansion** menu item under the "User" tab, you will see a new menu. Click on "Zerynth" item. Ensure that the ZM1-EVA board is enabled.

<figure>
  <a data-fancybox="gallery" href="../img/davra_tutorial/zm1-enabled.png">
  <img src="../img/davra_tutorial/zm1-enabled.png" />
  </a>
  <figcaption>ZM1-EVA enabled</figcaption>
</figure>

## Provision and configure the Device
You only need to provision your device once for the lifetime of the device.

Just click `Provisioning` on the `Zerynth Control Panel`, you will be asked to create a cloud device, 
give it a name like `my-iot-davra-device` and accept the confirmation dialog and wait a little.

After provisioning, in the control panel, You'll find the cloud device is now assigned an ID.

## Run the project
Open the `main.py` file in the project folder, and edit the rows **49** and **50** typing your WiFi SSID and password.

At this point you are ready to click on the **Run** button! Your device will be automatically configured and it will start
publishing data to the Zerynth Cloud.

If you open the device page from the [Zerynth Cloud](https://cloud.zerynth.com), you will see real time data coming from your device!

## Create Davra integration
The last step to receive the data published from the device to you Davra dashboard is to create a **Davra Integration**.

1.  Open the [Zerynth Cloud](https://cloud.zerynth.com) and select the workspace containing the device you configured before (probably the "default" one);
2.  Click on the **Integrations** button from the navbar on the left;
3.  Click on the **+ New** button on the top right, then select **Davra** from the dialog;
  <figure>
    <a data-fancybox="gallery" href="../img/davra_tutorial/davra-integration.png">
    <img src="../img/davra_tutorial/davra-integration.png" />
    </a>
    <figcaption>Davra integration dialog</figcaption>
  </figure>
4.  Choose a name for your integration, check the url, type your personal Davra token and that's all! Your data will be automatically forwarded to your Davra dashboard.
