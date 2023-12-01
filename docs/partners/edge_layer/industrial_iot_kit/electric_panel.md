# Electric Panel

<figure>
  <a data-fancybox="gallery" href="../img/4zb-lite-ain.png">
  <img src="../img/4zb-lite-ain.png"width="400" />
  </a>
</figure>

## Target Asset

* Monitoring of Electric Panel where consumptions of Input and Output lines is required. 
* Suitable for monitoring where multiple power lines signals must be acquired
With this kit Electric Panels are interface typically via 3 power clamp for the Input lines and via up to 5 power clamps for the Output lines.
* Lines and Panel status can be inferred via power consumption level analysis (thresholds);

## Features

* Edge device with 8 AIN for analog sensors. 
* 8 AIN can be used for power clamps, other analog signals or also for digital signal sampling (required for scrapes signal detection when available)
* Ethernet/Wifi Connectivity
* The kit includes: 
    * 1x 4ZeroBox Lite (DB+AIN)
    * 1x 220-24V power supply, 
    * 8x 100A power clamp (500A power clamp are also available as addon, verify and notify this need to the delivery team)

## General Hardware Characteristics

### DB-ZM1

<figure>
  <a data-fancybox="gallery" href="../img/ZM1-DB-front.png">
  <img src="../img/ZM1-DB-front.png"width="400" />
  </a>
</figure>

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


### EXP-AIN

<figure>
  <a data-fancybox="gallery" href="../img/EXP-AIN-front.png">
  <img src="../img/EXP-AIN-front.png"width="400" />
  </a>
</figure>


The EXP-AIN expansion board is a Analog input module that features:

* **8 Analog Channels configurable as**
    * 4-20 mA Current channel (full input range ̣±20 mA);
    * 0-10V Voltage Channel (full input range ±10 V);
    * Resistive Sensor Channel;

## Screw Description


### DB-ZM1


**Connector J1**

| Screw Number | Symbol |	Description |
|--------------|--------|-------------|
| 1            | Power+ | External Power Supply positive pin |
| 2            | Power- | External Power Supply negative pin |

### EXP-AIN

**P1 - Upper Screw Terminal**

| Screw Number | Symbol |	Description |
|--------------|--------|-------------|
| 1,2 |	AIN5-/AIN5+  | Analog Input Channel #5 4-20mA/0-10V/Resis./Current |
| 3,4 |	AIN6-/AIN6+	 | Analog Input Channel #6 4-20mA/0-10V/Resis./Current |
| 5,6 |	AIN7-/AIN7+	 | Analog Input Channel #7 4-20mA/0-10V/Resis./Current |
| 7,8 |	AIN8-/AIN8+	 | Analog Input Channel #8 4-20mA/0-10V/Resis./Current |
| 9 |	GND |	Isolated Ground reference for analog bias |


**P2 - Lower Screw Terminal**

| Screw Number | Symbol |	Description |
|--------------|--------|-------------|
| 10,11 |	AIN1-/AIN1+  | Analog Input Channel #1 4-20mA/0-10V/Resis./Current |
| 12,13 |	AIN2-/AIN2+	 | Analog Input Channel #2 4-20mA/0-10V/Resis./Current |
| 14,15 |	AIN3-/AIN3+	 | Analog Input Channel #3 4-20mA/0-10V/Resis./Current |
| 16,17 |	AIN4-/AIN4+	 | Analog Input Channel #4 4-20mA/0-10V/Resis./Current |
| 18 |	GND |	Isolated Ground reference for analog bias  |


**NOTE**: All I/O pins on screw terminals are isolated from the zBUS interface.



* Isolation: 125V(rms) / 1500V(peak) 
* Overvoltage Cat.II / Pollution Deg.II

**NOTE:** Analog channel to channel isolation > 250kΩ


## Switches


### Rotary-switches

**ADDR SW**: Chooses the address of the ADC Chip. Enable multiple boards to be  connected simultaneously. Present in **EXP-AIN** as **SW1**.

| Position | Address |
|----------|---------|
| 0        | 0x10    |
| 1        | 0x11    |
| 2        | 0x12    |
| 3        | 0x13    |


**INT SW: **Controls which hardware channel you want to link the interrupt. Present in **EXP-AIN** as **SW2**. 


| Pin | Pin on zBUS | Pin ZM1-DB |
|-----|-------------|------------|
| 0   | INTR        | D35        |
| 1   | INTB        | NC         |
| 2   | INTE1       | D46        |
| 3   | INTE2       | D47        |

### Dip-switches

**EXP-AIN** has a different set of dip-switches that allow it to change the configuration of the expansion. 

Switch **Sx**: each Analog channel can be configured with 3 DIP switches that enable specific features. Each **Sx** switch controls two Analog channels



| Pin          | OFF      | ON                                             |
|--------------|-----------|---------------------------------------------------------|
| 1            | Gain ADC AINx = 1 | Gain ADC AINx = 5 |
| 2            | AINx read as voltage    | AINx read as Current                             |
| 3            | -    | AINx read as resistive sensor                                  |
| 4            | Gain ADC AINy = 1    | Gain ADC AINy = 5                                 |
| 5            | AINy read as voltage    | AINy read as Current                                   |
| 6            | -    | AINy read as resistive sensor                                 |

## Technical Specifications

<table>
  <tr>
   <td colspan="2" >
    <strong>Power Supply</strong>
   </td>
  </tr>
  <tr>
   <td>
    <strong>Voltage</strong>
   </td>
   <td>
    9-36 V DC
   </td>
  </tr>
  <tr>
   <td>
    <strong>Power Consumption</strong>
   </td>
   <td>
    Typical: 1 W; Maximum: 5 W.
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" >
    <strong>Inputs / Outputs</strong>
   </td>
  </tr>
  <tr>
   <td>
    <strong>Microcontroller I/O Pin Voltage</strong>
   </td>
   <td>
    Max supported voltage: 3.3 V
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" >
    <strong>Environmental Conditions</strong>
   </td>
  </tr>
  <tr>
   <td>
    <strong>Temperature</strong>
   </td>
   <td>
    -40 to +85 °C
   </td>
  </tr>
  <tr>
   <td>
    <strong>Humidity</strong>
   </td>
   <td>
    Max 80% (not condensing)
   </td>
  </tr>
  <tr>
   <td>
    <strong>Storage Temperature</strong>
   </td>
   <td>
    -40 to +85 °C
   </td>
  </tr>
  <tr>
   <td>
    <strong>Degree Protection</strong>
   </td>
   <td>
    &lt; IP40
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="2" >
    <strong>Connectors</strong>
   </td>
  </tr>
  <tr>
   <td>
    <strong>Ethernet</strong>
   </td>
   <td>
    RJ45 Connector
   </td>
  </tr>
  <tr>
   <td>
    <strong>Programming</strong>
   </td>
   <td>
    USB-C Connector
   </td>
  </tr>
  <tr>
   <td>
    <strong>Micro SD</strong>
   </td>
   <td>
    Micro SD Slot
   </td>
  </tr>
</table>



<table>
  <tr>
   <td colspan="3" >
    <strong>Operating Frequency</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Categories</strong>
   </td>
   <td>
    <strong>Items</strong>
   </td>
   <td>
    <strong>Specifications</strong>
   </td>
  </tr>
  <tr>
   <td rowspan="2" ><strong>Certification</strong>
   </td>
   <td>
    RF Certification
   </td>
   <td>
    FCC/CE-RED
   </td>
  </tr>
  <tr>
   <td>
    Green Certification
   </td>
   <td>
    RoHS/REACH
   </td>
  </tr>
  <tr>
   <td><strong>Test</strong>
   </td>
   <td>
    Reliability
   </td>
   <td>
    HTOL/HTSL/uHAST/TCT/ESD
   </td>
  </tr>
  <tr>
   <td rowspan="3" ><strong>Wi-Fi</strong>
   </td>
   <td rowspan="2" >
    Protocols
   </td>
   <td>
    802.11 b/g/n (802.11n up to 150 Mbps)
   </td>
  </tr>
  <tr>
   <td>
    A-MPDU and A-MSDU aggregation and 0.4 µs guard interval support
   </td>
  </tr>
  <tr>
   <td>
    Frequency Range
   </td>
   <td>
    2.4 ~ 2.5 GHz
   </td>
  </tr>
  <tr>
   <td rowspan="4" ><strong>Bluetooth</strong>
   </td>
   <td>
    Protocols
   </td>
   <td>
    Bluetooth v4.2 BR/EDR 
   </td>
  </tr>
  <tr>
   <td rowspan="3" >
    Radio
   </td>
   <td>
    NZIF receiver with –97 dBm sensitivity
   </td>
  </tr>
  <tr>
   <td>
    NZIF receiver with –97 dBm sensitivity
   </td>
  </tr>
  <tr>
   <td>
    AFH
   </td>
  </tr>
</table>

## Apps Wiring Guide

[Follow this link for the wiring guide](../../wiring_guide/index.md)