# **4ZeroBox Mobile**

The 4ZeroBox Mobile is an Industrial data acquisition device that features Cellular 2G, NB-IOT and Wi-Fi connectivity and GPS Capabilities. There are many onboard features like: a DIN-rail mountable case,  industrial grade sensor channels, support for Wi-Fi, Relays, support for CAN protocols, RS485, RS232 interfaces.
The 4ZeroBox Mobile can be integrated with any of Zerynth expansion boards. They can act as a prototype during the development stage, and a core for industrial applications.


<figure>
  <a data-fancybox="gallery" href="../img/4zb_mobile.jpg">
  <img src="../img/4zb_mobile.jpg" />
  </a>
</figure>

!!! warning
    In windows it may be necessary to install USB drivers. You can find them [here](http://www.wch-ic.com/downloads/CH341SER_ZIP.html).

## **Device Summary**

* ZM1 Module

    -   32-bit dual Core microcontroller based on the ESP32-WROOM-32SE. 
    -   Clock frequency upto 240 Mhz.
    -   Embedded 16 MB SPI Flash memory.
    -   Integrates the ATECC608A crypto element allowing ultra-secure communication.
    -   WiFi (Client and AP mode supported) and Bluetooth® Low-Energy Support

    
* 6 Analog channels that can measure (according to the dip switch configuration):

    -   4-20mA sensors (single ended or differential)
    -   0-10V sensors (single ended or differential)
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


## **Resources**

For more infos about electrical connections, and how to use 4ZeroBox Mobile with sensors and other hardware, see the  [user manual](https://www.zerynth.com).


## **Pin Mapping**

<figure>
  <a data-fancybox="gallery" href="../img/4zerobox-mobile-pinmap.jpg">
  <img src="../img/4zerobox-mobile-pinmap.jpg" />
  </a>
</figure>

## **Getting Started**

For step-by-step guide on connecting, running your first example, Please refer to [the Getting started guide for the 4ZeroBox Mobile](../../gettingstarted/4ZeroBox_4zeroboxMobile/)

## **4ZeroBox Mobile Software Library**

For more information on the 4ZeroBox mobile software Library, Its features, functions and examples demos
[Please check this Link](../../reference/libs/expansions/)


## **Power**

Power to the 4ZeroBox mobile is supplied via the on-board USB Micro B connector or directly via the  9V-36V pins on the P1 connector. The power source is selected automatically. Zerynth 4ZeroBox Mobile has also a JST Li-Po battery connector (3.7V).
