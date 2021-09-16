## V3.0.6

### Added
- DHT11 temperature and humidity sensor support.
- WiFi WPA2 Enterprise PEAP authentication support.
- OPC-UA network protocol.
- ZDM logout function.
- Example for DHT11 temperature and humidity sensor
- Example for EXP-AIN expansion board.
- Example for WPA2 enterprise authentication.

### Changed
- ZM1 Evaluation Board (ZM1-EVA) enabled by default in Zerynth VSCode extension.

### Fixed
- WiFi interface handling by the WiFi sniffer.
- Problems with ethernet link loss and interface restart.
- Upload firmware function improved regarding network timeouts.
- Ethernet function name typo.
- Some old examples have been updated.

## V3.0.5

### Added
- WiFi sniffer.
- TSLog peek(), next(), uncommitted() methods.

### Fixed
- TSLog reader commit.
- Raise exception when ADC I2C read transaction fails.
- Message dialogs displayed about already running tasks with latest VSCode versions.

## V3.0.4

### Added
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

### Changed
- Zerynth VSCode extension auto updates SDK Toolchain.
- Sensor module accepts both EXP-IO and EXP-AIN boards.
- On ZM1-DB board, the sensor lib has been simplified and unified for all expansion boards.

### Fixed
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
