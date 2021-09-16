# Watchdog

A watchdog resets the board if the firmware hangs. It's a must have for real products.
It resets the board after a period of time in which the firmware does not "kick" the watchdog notifying
that it is working correctly.

In Zerynth the watchdog is configured *before* the firmware starts and can be reconfigured in the firmware.
The initial time window of the watchdog is define in the `config.yml` project file with the ZERYNTH_EARLY_WATCHDOG variable. If ZERYNTH_EARLY_WATCHDOG is not defined, the default value of 9000 milliseconds is used.

## Functions

### function `setup`
```python
setup(millis)
```

Sets the watchdog to fire after `millis` milliseconds.


### function `kick`
```python
kick()
```

Reset the watchdog counter to avoid firing.

## Examples

See the [watchdog example](../../examples/zerynth-os/watchdog.md).

