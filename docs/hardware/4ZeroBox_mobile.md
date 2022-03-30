# **4ZeroBox Mobile**

The 4ZeroBox Mobile is an Industrial data acquisition device that features Cellular 2G, NB-IOT and Wi-Fi connectivity and GPS Capabilities. There are many onboard features like: a DIN-rail mountable case,  industrial grade sensor channels, support for Wi-Fi, Relays, support for CAN protocols, RS485, RS232 interfaces.
The 4ZeroBox Mobile can be integrated with any of Zerynth expansion boards. They can act as a prototype during the development stage, and a core for industrial applications.


<figure>
  <a data-fancybox="gallery" href="../img/4zb_mobile.jpg">
  <img src="../img/4zb_mobile.jpg" />
  </a>
</figure>

## **Windows drivers**

In windows it may be necessary to ***install USB drivers***. See the [driver page](/reference/faq/hardware/#do-i-need-special-drivers-for-zerynth-hardware) for details.

## **Device Summary**

* ZM1 Module

    -   32-bit dual Core microcontroller based on the ESP32-WROOM-32SE. 
    -   Clock frequency upto 240 Mhz.
    -   Embedded 16 MB SPI Flash memory.
    -   Integrates the ATECC608A crypto element allowing ultra-secure communication.
    -   WiFi (Client and AP mode supported) and Bluetooth® Low-Energy Support

    
* 6 Analog channels that can measure (according to the dip switch configuration):

    -   4-20mA sensors (full input range +/-20mA)(single ended or differential)
    -   0-10V sensors (full input range +/-10V)(single ended or differential)
    -   current transformers (non-invasive)
    -   resistive sensors (NTC, RTD, contact, proximity, etc.)
 
* 2 solid state relay channels 

    -   Max voltage (open circuit) = 36VDC 
    -   Max current (closed circuit) = 150mA
    
* RS232 and RS485 Interface.

* CAN Protocol is supported.

* Supports USB-C for PC communication and power.

* USB-C Slot for DEBUG/updating Firmware of BG95

* SMA Antenna for GSM/GPRS (SX) and GPS (DX)

* LiPo Battery support

* JTAG support 


## **Resources and Documents**

For more infos about electrical connections, and how to use 4ZeroBox Mobile with sensors and other hardware, Please refer to the [user manual](https://www.zerynth.com/download/27677/).


## **Pin Mapping**

<figure>
  <a data-fancybox="gallery" href="../img/4zerobox-mobile-pinmap.jpg">
  <img src="../img/4zerobox-mobile-pinmap.jpg" />
  </a>
</figure>

## **Getting Started**

For step-by-step guide on connecting, running your first example, Please refer to [the Getting started guide for the 4ZeroBox Mobile](../../gettingstarted/4ZeroBox_mobile/)

## **Software Library**

For more information on the 4ZeroBox mobile software Library, Its features, functions and examples demos
[Please check this Link](../../reference/libs/expansions/)


## **Power**

Power to the 4ZeroBox mobile is supplied via the on-board USB Micro B connector or directly via the  9V-36V pins on the P1 connector. The power source is selected automatically. Zerynth 4ZeroBox Mobile has also a JST Li-Po battery connector (3.7V).

## **zBus**

The zBus is an efficient, powerful standard for connecting and prototyping different sensors and devices.
The zBus is using the CN1 pin header (20x2) exposing the following:

* 16 GPIO pins.
* 4 interrupt pins.
* 2 USART/UART instances with full support (TX,RX,RTS,CTS)
* I2C, SPI support.
* 5V, 3.3 V output pins.
* Enable pin for controlling the power to attached expansion boards.


The zBus allows the connection in a cascade of different add-on modules to create specific industrial applications that fit into a DIN-RAIL case.

The development board offers a modular expansion system that adds expansion boards through the connectors on the board (zbus).
Expansion boards vary in features and functionalities. Currently, Zerynth offers expansion boards for :
<figure>
  <a data-fancybox="gallery" href="../img/Boards.jpg">
  <img src="../img/Boards.jpg"/>
  </a>
</figure>

Expansion boards vary in features and functionality. Currently, Zerynth offers expansion boards for :

-   [EXP-AIN](EXP-AIN.md): Expansion board with 8 Industrial analog input channels
-   [EXP-CONNECT](EXP-CON.md): GSM-NB-IoT and GPS enabled expansion module.
-   [EXP-IO](EXP-IO.md): Industrial input/output board with 4 solid-state relays, 2 analog channels (4-20mA/0-10V/NTC/current clamp) channels, 2 opto-isolated digital inputs
-   [EXP-RELAY](EXP-RELAY.md): Relay board with 6 Electromechanical power relays rated 6A 250VAC.
-   [EXP-SER](EXP-SER.md): Serial Communication board with : CAN, RS232 and RS485  interfaces.
-   [EXP-PROTO](EXP-PROTO.md): Prototyping board for connecting and testing different types of sensors and devices.
