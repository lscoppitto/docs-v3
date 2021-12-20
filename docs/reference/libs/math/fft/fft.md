# FFT

### class `FFT`
```python
FFT(n, is_inverse=False, is_real=True)
```
Creates an object to handle the Fast Fourier Transform.
* `n` is the number of input elements that will be feed to the transform;
* `is_inverse` if set to `True` the `FFT` class will perform the inverse Fast Furier Transform;
* `is_real` if set to `True` the `FFT` will be optimized to transform an input array with only real elements. This will result in less resources consumption and faster computation but limit the `FFT` to use only real input.

The `FFT` class features `__setitem__` to pass inputs and `__getitem__` to get outputs. This allows to set inputs as `fourier[i] = input_element` and get outputs as `output_element = fourier[i]` with fourier as `FFT` object.

The `FFT` class also features `__iter__` and `__next__` to be iterable.


Returns a `FFT` object.

### method `fft`
```python
fft()
```
Performs a Fast Fourier Transform of the `n` input data set.
Before calling the `fft` method all the `n` inputs must be provided using the settable features of the `FFT` class.
Once the Fast Fourier Transform is done, outputs can be accessed using the gettable feature of the `FFT` class.

### method `amplitude`
```python
amplitude(i)
```
Get the amplitude of the `i` element of the output array.
* `i` is the index of the output to compute the amplitude of.

Returns the amplitude (`sqrt(|out|/n)`) of the element.

### method `phase`
```python
phase(i, threshold=0)
```
Get the phase of the `i` element of the output array. If the `amplitude` value of the `i` element is smaller than the `threshold` the phase is not computed and set to zero.
* `i` is the index of the output to compute the phase of.
* `threshold` is the amplitude threshold used to filter. Default value is `0`.

*** note ***: the `threshold` is often necessary to prevent noise coming from the finite precision of floating point values.

Returns the phase (`atan(out_imm/out_real)`) of the element.