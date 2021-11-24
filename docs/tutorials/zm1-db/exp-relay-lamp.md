# Control Industrial Lamp with EXP-RELAY

Relays are extremely useful because they allow micro-controllers that work on low voltages (in range 1.8V to 5V) to control electrical circuits that work on high voltage or where current through the circuit is high. In industrial applications, relays are used wherever control of the circuit using a simple switch is necessary. As examples - home appliances, automobiles, communication devices, etc.

In this demo we will control AC lamp using the EXP-Relay board.

### **1. Create a project**

Let's create a new project, you can create a new project from scratch by pressing `Ctrl+Shift+P` and entering the command `New Zerynth project`.

### 2. Setup the hardware

<figure>
  <a data-fancybox="gallery" href="../img/relaylamp.jpg">
  <img src="../img/relaylamp.jpg"width="600"/>
  </a>
</figure>

### **3. Write the code**

The code is straight forward, the *BSP* pack automatically configures the imported libraries according to the attached board.

```python
from expansions import relay

# Initialize board and relay expansion by providing the position of rotary switches.
# In this demo, the arrow on the rotary switch points to 1.

board.init()
exp_relay = board.next_expansion(relay, (1,))

while True:

    # Change the state of the relay every 3 seconds.

    if exp_relay.is_relay_on(exp_relay.OUT1):
        exp_relay.relay_off(exp_relay.OUT1)
    else:
        exp_relay.relay_on(exp_relay.OUT1)
    sleep(3000)
```
### **4. Run the code**
Press *Physical Device* to recognize the board and configure the project accordingly.
If necessary, the extension will ask which board is connected.
Check the project for errors by pressing *Build*. If everything is ok, you can press *Run*. The SDK compiles the source files, creates a binary firmware, and burns it to the board.


<figure>
  <a data-fancybox="gallery" href="../img/relaylampon.jpg">
  <img src="../img/relaylampon.jpg"width="600"/>
  </a>
</figure>

