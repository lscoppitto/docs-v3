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
    | `connect` | EXP-CONNECT |


* `selectors` is a tuple with information on position of rotative switches of the expansion. Order follow swiches indexes.

### function `expansions_on`
```python
expansions_on()
```
Power on all the expansions conected to the ZM1-DB.

### function `expansions_off`
```python
expansions_off()
```
Shut down all the expansions conected to the ZM1-DB.

### function `led`
```python
led(color)
```
Set the color of the led.

* `color` is the color to set. Possible colors are. `BLACK`, `WHITE`, `RED`, `GREEN`, `BLUE`, `YELLOW`, `CYAN` and `MAGENTA`.

### function `init`
```python
init()
```
Reinitialize all exapansions connected to the ZM1-DB.

### function `set_adc_config`
```python
set_adc_config(pin, pga=1, sps=0)
```
Set sps configuration to use for an ADC pin. Pga currently not implemented.

* `pin` is the pin to configure.
* `pga` is the gain. Not implemented yet.
* `sps` is the sample for seconds for the ADC pin. Default value use max speed.

### function `set_adc_callback`
```python
set_adc_callback(label, pin, cb=None, sens=None)
```
Setup a callback to convert ADC read values on an ADC pin. The ADC's read function will automatically call the passed callback after the bit to electric value conversion is completed.

* `label` is the label of the adc configuration to use.
    Possible labels are the following:
    1. `'vol'` for voltage reading ADC;
    2. `'res'` for resistive reading ADC;
    3. `'cur'` for current reading ADC;
    4. `'pow'` for power reading ADC.

* `pin` is the pin usef by the ADC to configure. Possible choices are `AIN1` to `AIN6`

* `cb` is the callback to setup to the specific channel.
    The callback should have the following signature: `cb(value, sens)` where `value` will be the electric value passed by the read and `sens` a some sort of structure with data needed by the conversion callback. The callback should return the converted value.

* `sens` is some sort of structure with data about the sensor to make the correct conversion.

### function `read_voltage`
```python
read_voltage(pin, raw=False, electric=False)
```
Read a and convert voltage value from a ADC pin. Voltage in V is passed to the callback.
* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN8`

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Voltage value (V) read is returned as result.

Returns the value converted by the pin callback. Voltage value (V) if the callback is set to `None`.

### function `read_resistive`
```python
read_resistive(pin, raw=False, electric=False)
```
Read an convert resistance value from a ADC pin. Resistance in Ohm is passed to the callback.
* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN8`

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Resistance value (Ohm) read is returned as result.

Returns the value converted by the pin callback. Resistance value (Ohm) if the callback is set to `None`.

### function `read_current`
```python
read_current(pin, raw=False, electric=False)
```
Read an convert current value from a ADC pin. Current in mA is passed to the callback.
* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN8`

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Current value (mA) read is returned as result.

Returns the value converted by the pin callback. Current value (mA) if the callback is set to `None`.

### function `read_power`
```python
read_power(pin, samples=400, raw=False, electric=False):
```
Read and convert power value from ADC pin. To do so, the ADC will get min and max values read on `samples`.
Difference between max and min in bits is passed to the callback.

* `pin` is the ADC pin to read from. Possible choices are `AIN1` to `AIN8`


* `samples` is the number of samples to get to find min and max values. Default value is 400.

* `raw` if set to `True` ADC's bits are returned as result.

* `electric` if set to `True` Differnce (max - min) Current (mA) read is returned as result.

Returns the value converted by the pin callback. Differnce (max - min) Current (mA) if callback is set to `None`.

### function `summary`
```python
summary()
```
Print a summary on ZM1-DB and its connected expansions.
