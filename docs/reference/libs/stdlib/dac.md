---
layout: blog
title: Dac
---

# Dac

This module loads the Digital to Analog Converter (dac) driver of the embedded device. This supports the use of pin added with expansions.

### function `add`
```python
add(pin)
```
This function configures a `pin` to be used as dac, if supported by it.

### function `write`
```python
write(pin, value)
```
This function writes the `value` in bits to the `pin` dac.

### function `read`
```python
read(pin)
```
This function returns the read value from the `pin` dac.

### function `rm`
```python
rm(pin)
```
This function removes the dac from the `pin`.