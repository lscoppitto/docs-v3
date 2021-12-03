# **4ZeroBox**

The 4ZeroBox is a modular hardware electronic unit that simplifies the development of Industrial IoT applications allowing rapid integration with sensors, actuators, and Cloud services.

**Features**

* 4 Industrial Analog input channels, 2 Opto-isolated channels and 2 digital outputs.
* Runs on ZM1 module (up to 240MHz, 16Mb of Flash, up to 600 MIPS)
* Microchip ATECC608A crypto chip to ensure high-standard security.
* Wi-Fi-and-Bluetooth,Ethernet support.
* 2 On-board Relays, CAN, RS232 and RS485 Interfaces.
* DIN-rail mountable (9 slots)

<figure>
  <a data-fancybox="gallery" href="../img/4zerobox.png">
  <img src="../img/4zerobox.png"width="400" />
  </a>
</figure>

!!! warning
    In windows it may be necessary to install USB drivers. You can find them [here](https://sparks.gogo.co.nz/ch340.html).

## **Device Summary**

* 4 Industrial Analog input channels, 2 Opto-isolated channels and 2 digital outputs(2A @ 30V).
* Runs on ZM1 module (up to 240MHz, 16Mb of Flash, up to 600 MIPS)
* Microchip ATECC608A crypto chip to ensure high-standard security.
* Wi-Fi-and-Bluetooth,Ethernet support.
* 2 On-board Relays (6A @ 250V AC), CAN, RS232 and RS485 Interfaces.
* DIN-rail mountable (9 slots)
* 8 to 36V Power Supply
* MicroSD card slot
* Li-Po battery support
* RGB status led
* Powered by Zerynth OS – efficient and easy to use, Python enabled OS for IoT applications.

    

## **Resources**

* [User manual](https://www.zerynth.com/download/13894/)
* [Board support package](../../reference/bsp/4zerobox_v9/)


## **Pin Mapping**

<figure>
  <a data-fancybox="gallery" href="../img/4zerobox-pin-map.jpg">
  <img src="../img/4zerobox-pin-map.jpg" />
  </a>
</figure>


## **Getting Started**

For step-by-step guide on connecting, running your first example, Please refer to [the Getting started guide for the 4ZeroBox](../../gettingstarted/4ZeroBox/)

## **Software Library**

For more information on the 4ZeroBox drivers, examples and supported peripherals and libraries,
[Please check the 4zerobox board support package.](../../reference/bsp/4zerobox_v9/)


## **Power**

Power to the 4ZeroBox is supplied via the on-board USB Micro B connector or directly via the “24V” screw. The power source is selected automatically. Zerynth 4ZeroBox has also a JST Li-Po battery connector (3.7V).


<!--

## Flash Layout

The internal flash of the ESP32 module is organized in a single flash area with pages of 4096 bytes each. The flash starts at address 0x00000, but many areas are reserved for Esp32 IDF SDK and Zerynth OS. There exist two different layouts based on the presence of BLE support.

| Start address | Size  | Content                 |
|---------------|-------|-------------------------|
| 0x0000A000    | 20Kb  | Esp32 NVS area          |
| 0x0000F000    | 4Kb   | Esp32 PHY data          |
| 0x00010000    | 2Mb   | Zerynth OS              |
| 0x00210000    | 1Mb   | Zerynth Bytecode        |
| 0x00310000    | 3Mb   | Zerynth OTA             |
| 0x00920000    | 7040Kb| File System             |


-->
