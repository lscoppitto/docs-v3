# Temperature and Humidity monitoring with EXP-PROTO
Prototyping is a crucial step in the development cycle of every product. Fixing bugs or even making changes in the hardware design during later phases of the project can be very expensive. Hence, the EXP-PROTO expansion board enables fast and easy prototyping of components, ICs, devices and microcontrollers saving the developer time and money. All connections are connected to the Z-BUS so you can add additional expansion boards that have industrial Relays, sensor channels, or communicate over industrial communication protocols.

In this demo, we will create a simple application which will read the measurements from the BME280 and print it to the console.


### **1. Create a project**

Let's create a new project, you can create a new project from scratch by pressing `Ctrl+Shift+P` and entering the command `New Zerynth project`.


### 2. Setup the hardware

  

We will use the [Bosch BME280](https://www.bosch-sensortec.com/products/environmental-sensors/humidity-sensors-bme280/) sensor to measures relative humidity, barometric pressure, and ambient temperature.

<figure>
  <a data-fancybox="gallery" href="../img/exp-proto-bme280-schematic.png">
  <img src="../img/exp-proto-bme280-schematic.png"width="500"/>
  </a>
</figure>

<figure>
  <a data-fancybox="gallery" href="../img/exp_proto_connected.jpg">
  <img src="../img/exp_proto_connected.jpg"width="500"/>
  </a>
</figure>

### **3. Write the code**


The BME280 is already supported in the SDK. All we need is to initialize the sensor by making a new instance of the BME280 class and then call Read functions to Read measurements, then finally print it to the console.



```python
from bsp import board
from components.bme280 import bme280

# Initialize board and BME280 soldered on EXP-PROTO expansion.

board.init()
sensor = bme280.BME280(I2C0)

    while True:
    # Read sensor measurements and print it to the console every 3 seconds.

      temperature = sensor.get_temp()
      pressure = sensor.get_press()
      humidity = sensor.get_hum()
      print("T:", temperature, "C | P:", pressure, "mbar | H:", humidity, "%")
      sleep(3000)
```

### **4. Run the example**

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The SDK compiles the source files, creates a binary firmware, and burns it to the board.

<figure>
  <a data-fancybox="gallery" href="../img/result_proto_bme280.jpg">
  <img src="../img/result_proto_bme280.jpg"width="500"/>
  </a>
</figure>

Hardware prototyping is an indispensable step toward creating new products, and the EXP-PROTO boards are the most reliable and affordable way to prototype your next IoT application. Because of ZSDK, creating a functional prototype is just a few lines of code and a cup of coffee away..
