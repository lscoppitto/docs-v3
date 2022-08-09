# EXP-AOUT

### class `EXP`
```python
EXP(position, selectors)
```
Creates an object for the expansion board connected to Zerynth ZM1 board at the `position` number, counting from left to right. Valid positions are 1 to 4.
`selectors` is a tuple composed as in the following:

0. Port Expansion (PE) address.

Once the `EXP` object is created, the expansion board can be used from the application by using the `dac` module.

Selector's values are from 0 to 3.
