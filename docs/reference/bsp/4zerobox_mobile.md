# 4ZeroBox Mobile

### function `next_expansion`
```python
next_expansion(e, selectors=None)
```
* `e` is the next expansion type module.

Use the following table to choose the right expansion.

    | module    | expansion   |
    |-----------|-------------|
    | `io`      | EXP-IO      |
    | `relay`   | EXP-RELAY   |
    | `ser`     | EXP-SER     |
    | `ain`     | EXP-AIN     |


* `selectors` is a tuple with information on position of rotative switches of the expansion. Order follow swiches indexes.

### function `expansions_on`
```python
expansions_on()
```
Powers on all the expansions conected to the 4ZeroBox Mobile.

### function `expansions_off`
```python
expansions_off()
```
Shuts down all the expansions conected to the 4ZeroBox Mobile.

### function `led`
```python
led(color)
```
Sets the color of the led.

* `color` is the color to set. Possible colors are. `BLACK`, `WHITE`, `RED`, `GREEN`, `BLUE`, `YELLOW`, `CYAN` and `MAGENTA`.

### function `on_button_press`
```python
on_button_press(fn, dir=FALLING_EDGE, debounce=0)
```
Sets-up the `USER_BUTTON` to call an interrupt callback when pressed.

* `fn` is the function to be called when the button is pressed;
* `dir` is the wave edge that will trigger the callback. Default is `FALLING_EDGE`;
* `debounce` is the De-Bounce delay to set.

### function `init`
```python
init()
```
Reinitializes all exapansions connected to the 4ZeroBox Mobile.

### function `set_adc_config`
```python
set_adc_config(pin, pga=1, sps=0)
```
Sets sps configuration to use for an ADC pin. Pga currently not implemented.

* `pin` is the pin to configure.
* `pga` is the gain. Not implemented yet.
* `sps` is the sample for seconds for the ADC pin. Default value use max speed.

### function `set_adc_callback`
```python
set_adc_callback(label, pin, cb=None, sens=None)
```
Sets-up a callback to convert ADC read values on an ADC pin. The ADC's read function will automatically call the passed callback after the bit to electric value conversion is completed.

* `label` is the label of the adc configuration to use.
    Possible labels are the following:
    1. `'vol'` for voltage reading ADC;
    2. `'res'` for resistive reading ADC;
    3. `'cur'` for current reading ADC;
    4. `'pow'` for power reading ADC.

* `pin` is the pin used by the ADC to configure. Possible choices are `AIN1` to `AIN6`

* `cb` is the callback to setup to the specific channel.
    The callback should have the following signature: `cb(value, sens)` where `value` will be the electric value passed by the read and `sens` a some sort of structure with data needed by the conversion callback. The callback should return the converted value.

* `sens` is some sort of structure with data about the sensor to make the correct conversion.

### function `read_voltage`
```python
read_voltage(pin, raw=False, electric=False)
```
Reads and converts voltage value from a ADC pin. Voltage in V is passed to the callback.
* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN6`

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Voltage value (V) read is returned as result.

Returns the value converted by the pin callback. Voltage value (V) if the callback is set to `None`.

### function `read_resistive`
```python
read_resistive(pin, raw=False, electric=False)
```
Reads and converts resistance value from a ADC pin. Resistance in Ohm is passed to the callback.
* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN6`

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Resistance value (Ohm) read is returned as result.

Returns the value converted by the pin callback. Resistance value (Ohm) if the callback is set to `None`.

### function `read_current`
```python
read_current(pin, raw=False, electric=False)
```
Reads and converts current value from a ADC pin. Current in mA is passed to the callback.
* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN6`

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Current value (mA) read is returned as result.

Returns the value converted by the pin callback. Current value (mA) if the callback is set to `None`.

### function `read_power`
```python
read_power(pin, samples=400, raw=False, electric=False):
```
Reads and converts power value from ADC pin. To do so, the ADC will get min and max values read on `samples`.
Difference between max and min in bits is passed to the callback.

* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN6`


* `samples` is the number of samples to get to find min and max values. Default value is 400.

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Differnce (max - min) Current (mA) read is returned as result.

Returns the value converted by the pin callback. Differnce (max - min) Current (mA) if callback is set to `None`.

### function `out_off`
```python
out_off(out)
```
Opens the selected relay switch.

* `out` is the relay to open. Possible choices are `DOUT1` and `DOUT2`.

### function `out_on`
```python
out_on(out)
```
Closes the selected relay switch.

* `out` is the relay to close. Possible choices are `DOUT1` and `DOUT2`.

### function `is_out_on`
```python
is_out_on(out)
```
Returns the current state of the relay switch.

* `out` is the relay to check. Possible choices are `DOUT1` and `DOUT2`.

Returns `1` if the relay is closed, `0` if open.

### function `get_can`
```python
get_can(nss=CTS1, spi_clk=20000000)
```
Gets a ready to use CAN object.

* `nss` is the chip select pin used to control the CAN peripheral through SPI.
* `spi_clk` is the clock speed used by the SPI. Default is 20 MHz.

Returns the initialized CAN object.

### function `get_serial`
```python
get_serial(ser=SERIAL1, baud=115200, stopbits=serial.STOPBIT_1, parity=serial.PARITY_NONE, bitsize=serial.BITSIZE_8, mode=serial.MODE_UART, flow_ctrl=serial.HW_FLOWCTRL_DISABLE)
```
Gets a ready to use serial (RS232 or RS485).

* `ser` is the serial port to use. Default `SERIAL1`
* `baud` is the baudrate of to use. Default 115200.
* `stopbits` is the stopbits configuration to use. Default 1 stopbit. See `serial` for possible values.
* `parity` is the parity check configuration to use. Default none. See `serial` for possible values.
* `bitsize` is the bitsize configuration to use. Default size 8. See `serial` for possible values.
* `mode` is the mode to use for the serial. Default RS232. See `serial` for possible values.
* `flow_ctrl` is the flow control configuration to use. Default disabled. See `serial` for possible values.

Returns the initialized serial object.

### function `start_cellular`
```python
start_cellular(apn="", apn_user="", apn_password="",
               dhcp=True, ip="", mask="", gateway="",
               dns="8.8.8.8", timeout=10000)
```
The function fully configures, initializes and starts the cellular module. The cellular module will be ready to use when this method resolves.

* `apn`: is the APN for the network connection. It depends from the SIM card provider.
* `apn_user`: the username for the network connection authentication. Usually it is empty. Default value empty string.
* `apn_password`: the password for the network connection authentication. Usually it is empty. Default value empty string.

If `dhcp` is *True* (the default) other following four IP related arguments are ignored.
When `dhcp` is *False*, the four IP related arguments are:

* `ip`: is the IP address.
* `mask`: the net mask expressed as A.B.C.D dotted address.
* `gateway`: the gateway to be used as default router.
* `dns`: the Domain Name Server to be used for name resolution. Default is "8.8.8.8", the Google DNS.

* `timeout`: Connection timeout in milliseconds. `CellularException` is raised if connection do not succeed during this time. Default value 10000 ms.

The `cellular` module is returned.

### function `stop_cellular`
```python
stop_cellular()
```
The interface is stopped, all connections dropped, and all socket related to cellular interface closed.

### function `reset_cellular`
```python
reset_cellular()
```
The function resets the Cellular hardware module and the GNSS subsystem. The started
network connections should have been closed before, otherwise they could fall in
an inconsistent state.

### function `antenna_on`
```python
antenna_on()
```
The function powers the GNSS antenna. The antenna is already powered by the `start_cellular` method.

### function `antenna_off`
```python
antenna_off()
```
The function shuts down the GNSS antenna.

### function `get_status`
```python
get_status()
```
The function returns the value of the status pin of the cellular modem. The pin will be high when the module is on.

### function `get_psm_ind`
```python
get_psm_ind()
```
The function returns the value of the psm indicator pin. The pin will be low when in PSM.

### function `get_ring`
```python
get_ring()
```
The function returns the value of the ring pin. The pin will go low when the ring triggers.

### function `setup_ring_cb`
```python
setup_ring_cb(cb)
```
The function setup the call back function to be called when the ring triggers.

### function `get_dcd`
```python
get_dcd()
```
The function returns the value of the dcd pin.

### function `get_power_source`
```python
get_power_source()
```
The function returns a string with the power source of the device. Possible return strings are `"external"`, `"battery"` or `"usb"`.

### function `read_vin`
```python
read_vin()
```
This function returns the applied external voltage in \[V\].

### function `read_vbat`
```python
read_vbat()
```
This function returns the applied battery voltage in \[V\].

### function `summary`
```python
summary()
```
Prints a summary on 4ZeroBox Mobile and its connected expansions.
