## V3.0.12

***Added***

- socket timeout to ModbusTCP class.
- on_reset event callback in zdm Agent.
- opcua write functions and support for authentication with username and password.

***Changed***

- Uniform get_serial\*() API across all boards.

***Fixed***

- pwm output on parameters change.
- Missing size argument into Modbus \_read\_input() method.
- zdm.publish() accepts dictionary payloads only.

## V3.0.11

***Changed***

- `Build` command of VSCode extension can be used with no device connected.

***Removed***

- ZDM Conditions. The `conditions` and `on_conditions` parameters are remove from the init method of the `zdm.Agent` class.
  The `zdm.Condition` class is removed.


***Fixed***

- Problem with `Build` and `Run` commands running twice with VSCode v1.65.0 and greater.

## V3.0.10

***Added***

- Support for Omron FINS protocol.
- Support to get and set the board hostname.
- Support for sensor module on ZM1-EVA device.
- RS485 and RS232 ready to go init functions for [4ZeroBox Mobile](../../hardware/4ZeroBox_mobile/).

***Fixed***

- Problem with concurrent serial port acces when using vhalSerialReadTimeout() zOS C function.
- Timeout could be handled the wrong way in some situation in vhalSerialReadTimeout() zOS C function.
- Errors in VSCode when ZERYNTH_SDK_HOME environment variable contains spaces on Windows platform.
- VSCode autoupdate to v3.0.9 from previous versions.


## V3.0.9

***Added***

- EthernetIP protocol support.
- close() method in snap7 module.
- gmtime() and mktime() functions in time module.
- GNSS enable/disable methods in cellular module.
- csv module.
- Conversion function in iim42652 component.
- Automatic tilt detection, wake on motion and significant motion detection in iim42652 component.
- ZFS feature.
- trunc(x, n) math function.
- fs module functions: fs.ls(), fs.rmtree(), fs.md5(), fs.copy(), fs.move().
- FFT module and exmaples.
- Battery and external power source, ADC reading and checks support for [4ZeroBox Mobile](../../hardware/4ZeroBox_mobile/).
- dcn command for 'zdm device identity' toolchain command.

***Changed***

- Fast RSSI get for already connected SSID using get_rssi() from WiFi module.
- TensorFlow lite updated to v2.6.2.
- Random function uses hardware RNG when available and falls back to posix rand() pseudo-random generator.
- Default pull to INPUT_PULLNONE in `gpio` module functions.
- Generate python code starting from C files dropped into "ml" directory into project resources, used by Machine Learning feature.
- Timeout increased to 10secs for device reset requests coming from Zerynth cloud.
- TSlog module is limited to internal flash only.
- Zerynth SDK examples moved to https://github.com/zerynth/examples.

***Fixed***

- Memory optimization for SNAP7 protocol.
- Possible crash after cellular modem deinit().
- Ethernet interface not reporting IP disconnection under some conditions.
- Calling random() many times in a second returned the same value.
- Problem on directory reading.
- Crash when calling `gpio.disable_interrupt()`.
- Added extra exceptions to handle some error conditions in mqtt module.
- When FOTA is ongoing the publish of cellular info and GNSS position are stopped to improve download stability.
- Conversion of resistive reads for [EXP-AIN](../../hardware/EXP-AIN), [EXP-IO](../../hardware/EXP-IO) and [4ZeroBox Mobile](../../hardware/4ZeroBox_mobile/). ADC range changed from 4096 to 4095
- Timer module resets the callback triggers.
- I2C address of the IIM hardware component mounted on the [4ZeroBox Mobile](../../hardware/4ZeroBox_mobile/).
- SERIAL0 port used for console can be reconfigured.
- LED initialization after init pins function.
- Read analog functions renamed on [4ZeroBox](../../hardware/4ZeroBox/) device: read_010 and read_420 become read_voltage and read_current. Old names still available for backward compatibility.

## V3.0.8

***Added***

- Configuration helper for cellular Quectel BG96 based click board on [4ZeroBox](../../hardware/4ZeroBox/).
- Reinitialization of expansion pins after power down of zBUS power.

***Fixed***

- Crash calling board.summary() on ZM1 Development Board with EXP-CONNECT attached.
- Claim device can fail under Windows systems with high system load.
- Auto reconfigure cellular module serial port on EXP-CONNECT board.
- MQTT memory leakage.
- VSCode closes all extension activities on exit.

## V3.0.7

***Added***

- [4ZeroBox Mobile](../../hardware/4ZeroBox_mobile/) device support.
- Cellular Quectel BG96 based click board on [4ZeroBox](../../hardware/4ZeroBox/) device support.
- [Function](../libs/networking/wifi/#function-ap_info) to get information about the WiFi connected Access Point.
- [Cellular and GNSS](../libs/networking/cellular/) library module.
- Tensorflow Lite support.
- New mqtt method to wait for mqtt broker ACK for publish with QOS > 0.
- Sensors hardware customizable parameters per expansion board.
- Time syncronization for drift fix and onfota callback status.
- User button default setup functions.
- Zerynth SIM management support in SDK toolchain.
- Zerynth VSCode extension control panel reorganized with new Zerynth SIM support.
- Zerynth VSCode extension setting to disable automatic SDK update.
- 'Upload firmware' available in Zerynth VSCode extension also when no board is connected to the PC/MAC.
- SDK Examples for cellular, GNSS and Tensorflow

***Changed***

- Filesystem mkdir() and rmdir() return errors via errno.
- Bootloader updated to version 2.
- Publish method of mqtt lib and zdm library modules take a timeout parameter to wait broker AKSs when QOS>0.

***Fixed***

- Improved stability for ZM1-EVA during startup.
- Improved stability for flash memory access on boards with CAN devices.
- Network DNS setup problem for some DHCP based environments.
- Fixed problems on some cases of static IP configuration on eth and wifi interfaces.
- The 4ZeroBox_v9 does a spurious reboot cycle after an hardware reset (power on or reset button).
- Improved SD stability on 4ZeroBox mobile.
- pylint path error on recent macOS releases while using Zerynth VSCode extension.

## V3.0.6

***Added***

- DHT11 temperature and humidity sensor support.
- WiFi WPA2 Enterprise PEAP authentication support.
- OPC-UA network protocol.
- ZDM logout function.
- Example for DHT11 temperature and humidity sensor
- Example for EXP-AIN expansion board.
- Example for WPA2 enterprise authentication.

***Changed***

- ZM1 Evaluation Board (ZM1-EVA) enabled by default in Zerynth VSCode extension.

***Fixed***

- WiFi interface handling by the WiFi sniffer.
- Problems with ethernet link loss and interface restart.
- Upload firmware function improved regarding network timeouts.
- Ethernet function name typo.
- Some old examples have been updated.

## V3.0.5

***Added***

- WiFi sniffer.
- TSLog peek(), next(), uncommitted() methods.

***Fixed***

- TSLog reader commit.
- Raise exception when ADC I2C read transaction fails.
- Message dialogs displayed about already running tasks with latest VSCode versions.

## V3.0.4

***Added***

- Support of external serializer in TSLog module. E.g.: json, cbor, etc.
- DS1307 based RTC (Real Time Clock) module.
- DS1307 based RTC (Real Time Clock) is used as system clock source when DS1307 gets initialized.
- EXP-AIN support.
- IIR filter module.
- WiFi scan and RSSI retrieval.
- Support for custom connected RGB LED.
- Support to get ADC electric values.
- ADC parameter to read electric values.
- Config of default pins for all boards.
- Timeout to read() and readline() functions.
- Example for IIM accelerometer and IIR filter.
- Example for DS1307 based RTC.

***Changed***

- Zerynth VSCode extension auto updates SDK Toolchain.
- Sensor module accepts both EXP-IO and EXP-AIN boards.
- On ZM1-DB board, the sensor lib has been simplified and unified for all expansion boards.

***Fixed***

- TSLog recreate.
- vhalPin functions improved for multithreading.
- readline() method in serial module.
- Typo in cbstd module.
- Multiple upgrades to sensor class and standard callbacks:
    - errors explaining what is the missing kay in json resource file.
    - on missing key the related sensor name is returned.
    - raw values from sensor class can be printed.
    - custom strings can be returned in json resource file.
- Default values and required delay for IIM42652 accelerometer module.
- Improved connection/disconnection checks in WiFi module.
- New exception in GPIO module.
- 4ZeroBox ethernet phy initialization and reset line.
- Set minimal watchdog timeout during FOTA, overriding the ZERYNTH_EARLY_WATCHDOG value set in the firmware config.yml.
- Possible race condition in DNS resolve.
- Common readline functions.
- vhalSerialReadTimeout() function may not work under some conditions.
- Enabled FAT32 Long File Names (LFN) support.
- TLS transactions may interfere with I2C attached peripherals under some conditions.

## V3.0.3

- redesigned and improved Zerynth Control Panel in the VSCODE Extension.
- 'Erase device' function, erases completely the flash memory of the device.
- 'Fast Burn' function.
- 'ztc device erase' new command to erase/forget the connected board flash.
- Added support for Cryptography libraries
- Improved error handling in VSCODE Extension.
- Several bug fixes and improvements in Zerynth OS.


## V3.0.2

- Enable Debug messages in VSCODE Extension.
- Several bug fixes and improvements in Zerynth OS.

## V3.0.1
- User experience improvements in various peripherals in Zerynth OS.
- Various Bug fixes related to VSCODE extension and the USB drivers of Zerynth boards.

## v3.0.0


v3.0.0 is the first release of Zerynth SDK v3.x
