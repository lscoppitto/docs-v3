# Use cellular connectivity and GPS with EXP-CONNECT
In this example, we will use the exp-connect to add cellular connectivity and GPS localization to our solution.
The EXP-CONNECT enables you to monitor and locate your assets, ensuring visibility of their position and allowing you to receive real-time notifications on critical events.

The expansion boards work seamlessly with the development boards that feature the **Z-Bus** such as the ZM1-DB and the industrial data acquisition devices.


#### Board Features
 
-   Quectel BG95-M3 modem 2G e NB-IoT: LPWA module which supports LTE Cat M1/Cat NB2/EGPRS and integrated GNSS.
-   MicroSIM Slot
-   GPS and GSM/NB-IoT Antennas: 2 SMA connectors

### **1. Create a project**

Just press `Ctrl+Shift+P` and type `examples` in the popup that VSCode displays.

<figure>
  <a data-fancybox="gallery" href="../img/example.jpg">
  <img src="../img/example.jpg" />
  </a>
</figure>

Simply choose `Zerynth > Search examples` and then type `cellular with GPS`. Select the `cellular with GPS` example and provide a folder to clone in. When ready, click `Clone Zerynth Example` and you are good to go.

### **2. Connect and configure**

1. attach the EXP-Connect to the ZM1-DB.
2. attach the antennas to the EXP-Connect.
3. put the sim card in the sim card slot.
4. power the ZM1-DB through the 24V power terminals.
5. Connect the ZM1-DB to the PC with the USB-C cable.

!!! warning
    The EXP-CONNECT works only if the ZM1-DB is powered with 24VDC from the external screws.

While the project is open, you can find information about the current project in the panel labeled *Zerynth Control Panel*.


Press *Physical Device* to recognize the board and configure the project accordingly.
If necessary, the extension will ask which board is connected.

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

### **3. Claim your device**
You need to claim your device and your SIM card only once. if you have not already claimed it, [please follow the guide in this link.](../../gettingstarted/ZM1-DB.md#claiming-as-cellular-connected-device)

### **4. Run the example**

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The SDK compiles the source files, creates a binary firmware, and burns it to the board.

Just press *Console* and the serial output of ZM1-DB will appear in the VSCode terminal.

```
[INFO ] bsp.board @:11 | Adding Port Expander...
[INFO ] bsp.board @:19 | Configuring ethernet phy power...
[INFO ] bsp.board @:23 | Configuring output only gpios...
[INFO ] bsp.board @:30 | Configuring input only gpios...
configuring cellular...
initializing cellular gnss submodule...
Doing the initial GPS fix (up to 120secs)...
connecting to cellular...
connected! (True, 10.13.134.14, 255.255.255.255, 10.64.64.64, 79.170.208.50, 00:00:00:00:00:00)
cellinfo:  (NOCONN, EDGE, 22210, GSM 900, 33, 30026, 40791, 55, 222, 10, vodafone IT)
[INFO ] zdm.zdm @_run:139 | Starting...
[INFO ] zdm.zdm @_connect:121 | Connecting...
[INFO ] zdm.zdm @_handle_dn_msg:258 | received message {"version":1637331992323,"key":"#status","value":{"current":{"__cellular":{"t":1637331857464,"v":null},"__gnss":{"t":1637331857480,"v":null},"__info":{"t":1637331674046,"v":null}},"expected":{}}}
[INFO ] zdm.zdm @_handle_delta_request:372 | delta request with key status
[INFO ] zdm.zdm @update_clock:287 | Sync time from ts: 1637331992
[INFO ] zdm.zdm @_handle_dn_msg:258 | received message {"version":1637331992798,"key":"#status","value":{"current":{"__cellular":{"t":1637331857464,"v":null},"__gnss":{"t":1637331857480,"v":null},"__info":{"t":1637331992333,"v":null}},"expected":{}}}
[INFO ] zdm.zdm @_handle_delta_request:372 | delta request with key status
[INFO ] zdm.zdm @update_clock:287 | Sync time from ts: 1637331992
fixinfo:  (43.7104, 10.4207, 0.600000, 18.5000, 3, 0.000000e-308, 0.000000e-308, 0.000000e-308, 0)
ZDM is online:     True
Firmware version:  Factory

```
now let's check the device page in *Zerynth Cloud*.
Click on the *cloud device* in the *zerynth control panel* to check the device status.



<figure>
  <a data-fancybox="gallery" href="../img/connect-device-data.jpg">
  <img src="../img/connect-device-data.jpg" />
  </a>
</figure>

<figure>
  <a data-fancybox="gallery" href="../img/connect-device-gps.jpg">
  <img src="../img/connect-device-gps.jpg" />
  </a>
</figure>

To view the received data, go to the *console* section in your device page in Zerynth Cloud.

Now the device is connected to the cloud over the cellular network, You can manage your device, update it or forward your data to 3rd party services like graphana or Azure.

We hope you enjoyed this new demo. Feel free to join our [community forum](https://community.zerynth.com/) if you have any additional questions.
