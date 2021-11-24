# Industrial Data Aquisition with EXP-IO Board

In this demo, we will measure the temperature from an Industrial temperature sensor and print it through the serial terminal.
we will use one of the 2 analog channels on-board.

The analog sensor channels, relays and the opto-isolated inputs enable users to connect wide range of devices and sensors in a way that is easy and compatibile with the Industrial IoT devices and modules.

### **1. Create a project**

Let's create a new project, you can create a new project from scratch by pressing `Ctrl+Shift+P` and entering the command `New Zerynth project`.

### 2. Setup the hardware


we are using the NTC015HP00 passive temperature probe. 
Connect the two terminals of the sensors to AIN1- and AIN1+ and the ground to the AIN1- pin.

<figure>
  <a data-fancybox="gallery" href="../img/exp_io_temp.jpg">
  <img src="../img/exp_io_temp.jpg"width="500"/>
  </a>
</figure>

### **3. Write the code**

```python
from bsp import board
from expansions import io
from zsensors import sensor

# Initialize board and relay expansion by providing the position of two rotary switches.
# In this demo the arrow on the ADDR rotary switch points to 1, while INT points to 0.
board.init()
exp_io = board.next_expansion(io, (1, 0))
sensor_dictionary = sensor.get_sensors_dict()

while True:

    # Read ADC and print a value every 3 seconds.
    temperature = sensor_dictionary["temperature"].read()
    print("T: ", temperature)
    sleep(3000)

```
        

### **4. Run the example**

Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The SDK compiles the source files, creates a binary firmware, and burns it to the board.

<figure>
  <a data-fancybox="gallery" href="../img/exp_io_temp_code3.png">
  <img src="../img/exp_io_temp_code3.png"width="500"/>
  </a>
</figure>


As you can see, thanks to the Zerynth SDK, the conversion is done -behind the scenes- for us. In the resource folder, there is a json file that contains the needed parameters to convert the measurments to the temperature values.
For more information about the `sensor` module, [Click here](https://docs.zerynth.com/latest/reference/libs/zerynth/zsensors/#function-get_sensors_dict).
