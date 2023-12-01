# Essential

<figure>
  <a data-fancybox="gallery" href="../img/4zb-lite-io.png">
  <img src="../img/4zb-lite-io.png"width="400" />
  </a>
</figure>

## Target Asset

* Retrofitting of Auxiliary Machinery or Production Machinery where interfacing with PLC or inverter is not required (digital protocol interfacing not supported). 
* Suitable for simple retrofitting where few signals are required
With this kit machines are interface typically via 1 power clamp and up to 3 extra signals (machine state, piece counter, scrapes counter)
* Machine status can be inferred via power consumption level analysis (thresholds) or via a dedicated digital signal if available on the machine. Power clamp with thresholds is the preferred solution but it is not always possible and reliable on some machines
* The kit is suitable also for minor customization like reading of temperature or other analog sensors. Be careful, there are only 2 AIN and 2 DIO on the 4ZeroBox Lite device

## Features

* Edge device with 2 DIO for signals reading and 2 AIN for analog sensors. 
* 2 AIN can be used for power clamps, other analog signals or also for digital signal sampling (required for scrapes signal detection when available)
* Ethernet/Wifi Connectivity
* The kit includes: 
    * 1x 4ZeroBox Lite (DB+IO)
    * 1x 220-24V power supply, 
    * 2x decoupling relays, 
    * 1x 100A power clamp (500A power clamp are also available as addon, verify and notify this need to the delivery team)

# General Hardware Characteristics

### DB-ZM1
The ZM1-DB is a flexible, modular, board that features the ZM1 SoM

* **ZM1 Module**
    * 32-bit dual Core MCU based on ESP32-WROOM-32SE;
    * Clock frequency up to 240 MHz;
    * Embedded 16 MB SPI Flash Memory;
    * Integrated ATECC608A crypto element allowing ultra-secure communications;
    * WiFi Support;
* 9 to 36V input Power Supply;
* MicroSD card slot;
* Ethernet Support;
* Reset and User Buttons;
* RGB status LED;
* USB-C power and programming.


### EXP-IO

The EXP-IO expansion board is a mixed input/output module that features:

* **2 Opto-Isolated Digital Inputs**
    * V<sub>on</sub> = 10.1 VDC (typ);
    * V<sub>off</sub> = 9.0 VDC (typ);
    * V<sub>max</sub> = 36 VDC;
    * I<sub>max</sub> = 1.86 mA (typ);
    * compatible with IEC 61131-2 Type 3;
* **2 Analog Channels configurable as**
    * 4-20 mA Current channel (full input range ̣±20 mA);
    * 0-10V Voltage Channel (full input range ±10 V);
    * Resistive Sensor Channel, which can be used for digital signal sampling;
* **4 Solid State Relays NO**
    * V<sub>max</sub>  (open circuit) = 36 VDC;
    * I<sub>max</sub> (closed circuit) = 150 mA;

## Screw Description


### DB-ZM1


<table>
  <tr>
   <td colspan="3" ><strong>Connector J1</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Screw Number</strong>
   </td>
   <td><strong>Symbol</strong>
   </td>
   <td><strong>Description</strong>
   </td>
  </tr>
  <tr>
   <td><strong>1</strong>
   </td>
   <td>Power+
   </td>
   <td>External Power Supply positive pin
   </td>
  </tr>
  <tr>
   <td><strong>2</strong>
   </td>
   <td>Power-
   </td>
   <td>External Power Supply negative pin
   </td>
  </tr>
</table>



### EXP-IO


<table>
  <tr>
   <td colspan="3" ><strong>P1 - Upper Screw Terminal</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Screw Number</strong>
   </td>
   <td><strong>Symbol</strong>
   </td>
   <td><strong>Description</strong>
   </td>
  </tr>
  <tr>
   <td><strong>1,2</strong>
   </td>
   <td><strong>OUT1</strong>
   </td>
   <td>Screw Terminal of the relay #1 ( OUT1 is normally open)
   </td>
  </tr>
  <tr>
   <td><strong>3,4</strong>
   </td>
   <td><strong>OUT2</strong>
   </td>
   <td>Screw Terminal of the relay #2 ( OUT2 is normally open)
   </td>
  </tr>
  <tr>
   <td><strong>5,6</strong>
   </td>
   <td><strong>OUT3</strong>
   </td>
   <td>Screw Terminal of the relay #3 ( OUT3 is normally open)
   </td>
  </tr>
  <tr>
   <td><strong>7,8</strong>
   </td>
   <td><strong>OUT4</strong>
   </td>
   <td>Screw Terminal of the relay #4 ( OUT4  is normally open)
   </td>
  </tr>
  <tr>
   <td><strong>9</strong>
   </td>
   <td><strong>GND</strong>
   </td>
   <td>Isolated Ground reference for analog bias
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="3" ><strong>P2 - Lower Screw Terminal</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Screw Number</strong>
   </td>
   <td><strong>Symbol</strong>
   </td>
   <td><strong>Description</strong>
   </td>
  </tr>
  <tr>
   <td><strong>10</strong>
   </td>
   <td><strong>DIN1-</strong>
   </td>
   <td>Digitally opto-Isolated digital Inputs
   </td>
  </tr>
  <tr>
   <td><strong>11</strong>
   </td>
   <td><strong>DIN1+</strong>
   </td>
   <td>Digitally opto-Isolated digital Inputs
   </td>
  </tr>
  <tr>
   <td><strong>12</strong>
   </td>
   <td><strong>DIN2-</strong>
   </td>
   <td>Digitally opto-Isolated digital Inputs
   </td>
  </tr>
  <tr>
   <td><strong>13</strong>
   </td>
   <td><strong>DIN2+</strong>
   </td>
   <td>Digitally opto-Isolated digital Inputs
   </td>
  </tr>
  <tr>
   <td><strong>14,15</strong>
   </td>
   <td><strong>AIN1-/AIN1+</strong>
   </td>
   <td>Analog Input Channel 4-20mA/0-10V/Resis./Current 
   </td>
  </tr>
  <tr>
   <td><strong>16,17</strong>
   </td>
   <td><strong>AIN2-/AIN2+</strong>
   </td>
   <td>Analog Input Channel 4-20mA/0-10V/Resis./Current 
   </td>
  </tr>
  <tr>
   <td><strong>18</strong>
   </td>
   <td><strong>GND</strong>
   </td>
   <td>Isolated Ground reference for analog bias
   </td>
  </tr>
</table>



    **NOTE**: All I/O pins on screw terminals are isolated from the zBUS interface.



* Isolation: 125V(rms) / 1500V(peak) 
* Overvoltage Cat.II / Pollution Deg.II

    **NOTE:** Analog channel to channel isolation > 250kΩ


## Switches


### Rotary-switches

**ADDR SW**: Chooses the address of the ADC Chip. Enable multiple boards to be  connected simultaneously. Present in **EXP-IO** as **SW1**.


<table>
  <tr>
   <td><strong>Position</strong>
   </td>
   <td><strong>Address</strong>
   </td>
  </tr>
  <tr>
   <td><strong>0</strong>
   </td>
   <td>0x10
   </td>
  </tr>
  <tr>
   <td><strong>1</strong>
   </td>
   <td>0x11
   </td>
  </tr>
  <tr>
   <td><strong>2</strong>
   </td>
   <td>0x12
   </td>
  </tr>
  <tr>
   <td><strong>3</strong>
   </td>
   <td>0x13
   </td>
  </tr>
</table>


**INT SW: **Controls which hardware channel you want to link the interrupt. Present in **EXP-IO** as **SW2**. 


<table>
  <tr>
   <td><strong>Position</strong>
   </td>
   <td><strong>Pin on zBUS</strong>
   </td>
   <td><strong>Pin ZM1-DB</strong>
   </td>
  </tr>
  <tr>
   <td><strong>0</strong>
   </td>
   <td>INTR
   </td>
   <td>D35
   </td>
  </tr>
  <tr>
   <td><strong>1</strong>
   </td>
   <td>INTB
   </td>
   <td>NC
   </td>
  </tr>
  <tr>
   <td><strong>2</strong>
   </td>
   <td>INTE1
   </td>
   <td>D46
   </td>
  </tr>
  <tr>
   <td><strong>3</strong>
   </td>
   <td>INTE2
   </td>
   <td>D47
   </td>
  </tr>
</table>



### Dip-switches

**EXP-IO** has a different set of dip-switches that allow it to change the configuration of the expansion. 

Switch **S1**: each Analog channel can be configured with 3 DIP switches that enable specific features.


<table>
  <tr>
   <td><strong>PIN</strong>
   </td>
   <td><strong>OFF</strong>
   </td>
   <td><strong>ON</strong>
   </td>
  </tr>
  <tr>
   <td>1
   </td>
   <td>Gain ADC AIN1 = 1
   </td>
   <td>Gain ADC AIN1 = 5  
   </td>
  </tr>
  <tr>
   <td>2
   </td>
   <td>AIN1 read as voltage
   </td>
   <td>AIN1 read as Current
   </td>
  </tr>
  <tr>
   <td>3
   </td>
   <td>-
   </td>
   <td>AIN1 read as resistive sensor
   </td>
  </tr>
  <tr>
   <td>4
   </td>
   <td>Gain ADC AIN2 = 1
   </td>
   <td>Gain ADC AIN2 = 5
   </td>
  </tr>
  <tr>
   <td>5
   </td>
   <td>AIN2 read as voltage
   </td>
   <td>AIN2 read as Current
   </td>
  </tr>
  <tr>
   <td>6
   </td>
   <td>-
   </td>
   <td>AIN2 read as resistive sensor
   </td>
  </tr>
</table>

## Apps Wiring Guide

[Follow this link for the wiring guide](../../wiring_guide/index.md)