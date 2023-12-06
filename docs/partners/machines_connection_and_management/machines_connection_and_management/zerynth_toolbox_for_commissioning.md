# Zerynth Toolbox for commissioning

<!-- [Download for Windows](#){ .md-button } [Download for Linux](#){ .md-button } -->
      

## Introduction

This toolbox aims to simplify both on site activities and testing of Zerynth apps using the Zerynth agents.
It features a Machine Scanner to acquire data from various PLCs, a PLC Simulator to replay the acquired data or to generate new data via an OPC-UA server and a Connectivity Checker to be able to test whether the Zerynth cloud endpoints are reachable. 
The windows executable is ready to be executed, while on Linux you need to download and then open a terminal and execute the following commands:
```bash
cd ~/Downloads
chmod +x zerynth-toolbox
./zerynth-toolbox
```

## PLC Simulator

The PLC Simulator can be used to simulate a production machine to test the 4ZeroAgent or to replay the data acquired from a real machine.

### Data generation

To simulate a production machine click on the `Generate data` radio button.
The simulated machine operates between two power levels, changing the number of produced pieces and the operation tag accordingly.

Here's how to setup the machine:

* **IP, Port:** The IP and the port where the OPC-UA server is running. While the port is customizable, be sure to double check the IP address as sometimes it can be incorrect (e.g. if the PC has 2 network interfaces, only one IP will be shown).
* **Low prod consumption (W):** the power consumption when the machine operates at the lower power level.
* **High prod consumption (W):** the power consumption when the machine operates at the higher power level.
* **High/low power period (s):** the period spent in each power level (e.g. if set to `10`, the machine will switch level every 10 seconds).
* **Pieces per minute (Low prod):**: how many pieces are produced in the Low production level.
* **Pieces per minute (Hi prod):**: how many pieces are produced in the Hi production level.
* **Good pieces %:** the percentage of good pieces produced.

![Start simulation](./img_zerynth_toolbox_for_commissioning/start_simulation.png)


Once started, the operation can be changed using the textbox (it uses the default operation tags if left empty) and the state of the machine can be controlled with the toggles at the bottom left:

* **Toggle alarm:** this switch sets the machine in the alarm state
* **Toggle idle/working:** this switch sets the machine status. In the idle state the power consumption is automatically set to  1/4 of the `Low prod consumption` value

![Control simulation](./img_zerynth_toolbox_for_commissioning/simulation_controls.png)


The OPC-UA server will expose the following nodes:

| Node ID  | Node Name           | Type   |
|:--------:|:-------------------:|:------:|
| ns=1;i=1 | Machine.Consumption | FLOAT  |
| ns=1;i=2 | Machine.Energy      | FLOAT  |
| ns=1;i=3 | Machine.PcsOk       | INT    |
| ns=1;i=4 | Machine.PcsKo       | INT    |
| ns=1;i=5 | Machine.Status      | INT    |
| ns=1;i=6 | Machine.Alarm       | INT    |
| ns=1;i=7 | Machine.Operation   | STRING |

### Replay acquisition

To replay an acquisition recorded using the [Machine Scanner](#recording-a-session), click on the `Replay acquisition` radio button, then click on the `Load acquisition file` button and select a valid CSV file.
Now you have to match the OPC-UA nodes with the correct CSV acquisition column.

![Replay acquisition](./img_zerynth_toolbox_for_commissioning/replay_acquisition.png)

Now you can start the server to replay and scrub through the acquisition.

!!! Note
    If a column contains an invalid value or if a node is not associated with any column, the node value will be set to `0` or `""`.
## Machine Scanner

### Analog and digital reading

If you have a 4ZeroBox with an EXP-IO connected, it can be used to read up to two amperometric clamps (0-5V) and to read up to two digital inputs.
Please, before connecting the device check the EXP-IO board and make sure that the `ADDR` switch is set to one and taht all the switches on the `S1` DIP switch are set to off. 

![Switch configuration](./img_zerynth_toolbox_for_commissioning/switch_config.png)

#### Install drivers (Windows only)

If you're on Windows and you haven't installed the drivers for the *CP210x USB to UART Bridge* yet, please install them before continuing.
First, download the drivers [here](https://www.silabs.com/documents/public/software/CP210x_Universal_Windows_Driver.zip) and unzip the folder.
Then press **WIN + x**, click on **Device manager** and look for **Other devices**

![Select device](./img_zerynth_toolbox_for_commissioning/select_device.png)

Then click on **Update driver**

![Update driver](./img_zerynth_toolbox_for_commissioning/update_driver.png){width=50%}

Click on **Browse my computer for drivers**

![Browse driver](./img_zerynth_toolbox_for_commissioning/select_driver.png){width=50%}

Finally, select the folder where you extracted the drivers and click on **Next**

![Select folder](./img_zerynth_toolbox_for_commissioning/select_folder.png){width=50%}

Now you should see the device listed under **Ports (COM & LPT)**

![Installed](./img_zerynth_toolbox_for_commissioning/drivers_installed.png){width=50%}



#### Flash the device

Once you installed the driver, you can flash the correct firmware on the device following these steps:

1. Connect the device
2. Go to the *Flash utilities* tab
3. Select the serial port to be used (on Linux click on `Refresh` if nothing shows up)
4. Select the `io_reader` firmware
5. Click on the `Flash` button

!!! Warning
    <u>The original firmware on the device will be overwritten!</u>

![Flash device](./img_zerynth_toolbox_for_commissioning/flash_firmware.png)

#### Read from the device

Once done, head to the *Machine Scanner* tab, and select the *Digital/Analog Scanner* tab. Here you can connect to the device as before.

![Connect to the reader](./img_zerynth_toolbox_for_commissioning/connect_reader.png)


Now, you can set the clamps amperage, the power source phases, the network voltage and specify whether the logic of the digital inputs has to be inverted.
Then, you can start reading from the device by clicking on the `Start reading` button.

!!! Note
    If the led of the device is flashing red, it means that it cannot connect to the EXP-IO board. In this case make sure that the switches are in the correct position.




### OPC-UA

To scan an OPC-UA server open the *Machine Scanner* tab and then click on *OPCUA*

![Machine scanner](./img_zerynth_toolbox_for_commissioning/machine_scanner.png)

Insert the following parameters:

* **IP/Hostname, Port and Path:** usually, an OPC-UA server is identified by an url like `opc.tcp://[ip or hostname]:port/path`. Leave the path empty if it's not needed.
* **Username and password:** provide these parameters if the server requires user authentication, otherwise leave them empty.
* **Certificate, key and Application URI:** provide these parameters if they are required by the server, otherwise leave them empty. The application URI can be found inspecting the certificate with the terminal command `openssl x509 -in certificate.crt -text -noout` and usually is something like `urn:host:field1:field2`. 

Now, you can start the scanner and wait for the scanning process to complete.

!!! Note
    The auto refresh feature **is still beta** and can lead to the crash of the application.

Once the scanner has finished its job, a new tab containing the scanned nodes will appear: there it's possible to open the record and the export dialog.



### Recording a session

To record a session click on the `Record` button

![Record](./img_zerynth_toolbox_for_commissioning/record_button.png)

select the nodes to record, select the acquisition frequency and start the recording.

![Record dialog](./img_zerynth_toolbox_for_commissioning/record_dialog.png)

To stop the recording, click on the `Record` button again and click on the stop button.
The session is saved on a csv file containing a column with the timestamp in millisecond and the columns containing the values:

| timestamp (ms) | ns=1;i=1 | ns=1;i=3 | ns=1;i=4 | ns=1;i=5 | ns=1;i=6 | ns=1;i=7 |
|:--------------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
| 1701095566041  | 1168.01  | 50       | 10       | 1        | 0        | HIGH     |
| 1701095566143  | 1201.99  | 50       | 10       | 1        | 0        | HIGH     |
| ...            | ...      | ...      | ...      | ...      | ...      | ...      |
| 1701095594530  | 600.11   | 106      | 16       | 1        | 0        | LOW      |
| 1701095594632  | 700.13   | 106      | 16       | 1        | 0        | LOW      |


### Exporting a table

To export a table click on the `Export table` button, select the nodes to export, then choose the format and click on `Export`.

![Export dialog](./img_zerynth_toolbox_for_commissioning/export_dialog.png)

The CSV format is useful for further reference of the server nodes, here's an example:

| nodeid   | name                | type   |
|:--------:|:-------------------:|:-------:
| ns=1;i=1 | Machine.Consumption | FLOAT  |
| ns=1;i=2 | Machine.Energy      | FLOAT  |
| ns=1;i=3 | Machine.PcsOk       | INT    |
| ns=1;i=4 | Machine.PcsKo       | INT    |
| ns=1;i=5 | Machine.Status      | INT    |
| ns=1;i=6 | Machine.Alarm       | INT    |
| ns=1;i=7 | Machine.Operation   | STRING |


<!-- insert configurator reference  -->

The JSON format, instead, is compatible with the 4ZeroAgent and can be used in the graph configurator (check [here](./advanced_configurator.md#OPCUA-Node)) to configure the `OpcuaNode` graph node.
Here's an example:

```json
{
    "nodes": [
        ["ns=1;i=1","FLOAT"],
        ["ns=1;i=2","FLOAT"],
        ["ns=1;i=3","INT"],
        ["ns=1;i=4","INT"],
        ["ns=1;i=5","INT"],
        ["ns=1;i=6","INT"],
        ["ns=1;i=7","STRING"]
    ]
}
```

## Connectivity Checker

This tool is useful to check whether the cloud endpoints are reachable and up.

If everything is ok you should see something like this

![Connection ok](./img_zerynth_toolbox_for_commissioning/con_ok.png)

Otherwise, you should see an error to the offline endpoints 

![Connection ko](./img_zerynth_toolbox_for_commissioning/con_ko.png)



!!! Note
    Make sure to connect the PC to the same network to which the device will be connected.