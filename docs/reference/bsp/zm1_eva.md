# ZM1-EVA
### function init
```python
init()
```
Reinitialize the board.

### function summary
```python
summary()
```
Print a summary on ZM1-EVA.

### function on_button_press
```python
on_button_press(fn, dir=FALLING_EDGE, debounce=0)
```
Set-up the `USER_BUTTON` to call an interrupt callback when pressed.

* `fn` is the function to be called when the button is pressed;
* `dir` is the wave edge that will trigger the callback. Default is `FALLING_EDGE`;
* `debounce` is the De-Bounce delay to set.