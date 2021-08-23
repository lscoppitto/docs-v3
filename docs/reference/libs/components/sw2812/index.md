# WS2812

_datasheet_: <http://www.world-semi.com/DownLoadFile/108>

This module implements the Zerynth driver for the Worldsemi WS2812 Intelligent Control RGB Led assembled in any form, ledstrip, or ring.

### class LedStrip
```python
LedStrip(pin, nleds)
```
Creates an instance of a ledstrip class, used to control the ledstrip.

* `pin` is the pin the ledstrip is wired to. The `pin` is automatically initialized to the correct mode.
* `nleds` is the number of leds that compose the strip.

### method on
```python
on()
```
Turns on the ledstrip, colouring each led with the configuration set with methods like `set`.

### method set
```python
set(n,r,g,b)
```
Sets the *nth* led of the strip to the `r`, `g`, `b` color specified. The led will change color only after the next call to `on`.

An equivalent and valid syntax is `ledstrip[n]=(r,g,b)`.

* `n` is the number of the led to control.
* `r` is the red value to set.
* `g` is the green value to set.
* `b` is the blue value to set.

### method setall
```python
setall(r,g,b)
```
Sets all the leds of the strip to the `r`, `g`, `b` color specified. The led will change color only after the next call to `on`.

* `r` is the red value to set.
* `g` is the green value to set.
* `b` is the blue value to set.

### method clear
```python
clear()
```
Sets all the leds of the strip to off. The leds will turn off after the next call to `on`.

### method lshift
```python
lshift()
```
Shifts to the left all the leds by one. The leds will change color only after the next call to `on`.

### method rshift
```python
rshift()
```
Shifts to the right all the leds by one. The leds will change color only after the next call to `on`.

### method brightness
```python
brightness(brt)
```
Multiplies all the led color by `brt`, a float between 0 and 1. The leds will change color only after the next call to `on`.

* `brt` is brightness value to set to the leds.

### method set_fading
```python
set_fading(r, g, b, pos=0)
```
Set the led to create a fading senquence (from max value to 0) over all the strip. The leds will change color only after the next call to `on`.

* `r` is the max red value of the fading sequence.
* `g` is the max green value of the fading sequence.
* `b` is the max blue value of the fading sequence.
* `pos` is the starting led of the fading sequence. Default is 0.

### method merge
```python
merge(lstrip, fun=add_color)
```
Merges `lstrip` with the current strip (`self`).
The resulting colors are calculated by applying *fun* to every corresponding pair of leds in the ledstrips.

The signature of fun must be `fun(r1,g1,b1,r2,b2,g2)` where r1,g1,b1 are the color components of the first strip
and r2,g2,b2 are the color components of the second strip. The default `add_color` sums colors component by component.

Merging strips is very useful for animations. Indeed one can build different layers on different strips, animate them separately and merge them in one single strip to be showed.

* `lstrip` is the ledstrip object to add.
* `fun` is the color function to use. Default is `add_color`.

### function add_color
```python
add_color(r1, g1, b1, r2, g2, b2)
```
Returns a tuple (r,g,b) where r=r1+r2, g=g1+g2, b=b1+b2. In case of overflow, components are capped to 255

### function first_color
```python
first_color(r1, g1, b1, r2, g2, b2)
```
Always returns (r1,g1,b1) unless all the components are zero. In that case it returns (r2,g2,b2).

### function second_color
```python
second_color(r1, g1, b1, r2, g2, b2)
```
Always returns (r2,g2,b2) unless all the components are zero. In that case it returns (r1,g1,b1)


### Example:
Sensor's calibration data are automatically read on object creation and setup method is called with default parameters. Temperature, humidity and pressure values can be easily obtained from the sensor:
```python
from components.bme280 import bme280

...

bme = bme280.BME280(I2C0)
temp, hum, pres = bme.get_values()
```
       

