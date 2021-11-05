# EXP-CONNECT

### class `EXP`
```python
EXP(position, selectors)
```
Created an object for the expansion board connected to Zerynth ZM1 board at the `position` number, counting from left to right. Valid positions are 1 to 4.
`selectors` is a tuple composed as in the following:

0. Ring pin.

Once the `EXP` object is created, the expansion board can be used from the application by using the `gpio` module.

Both values are integers from 0 to 3.

### method `start_cellular`
```python
start_cellular(apn="", apn_user="", apn_password="",
               dhcp=True, ip="", mask="", gateway="",
               dns="8.8.8.8", timeout=10000)
```
The method fully configure, initialize and start the cellular module. The cellular module will be ready to use when this method resolves.

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

### method `stop_cellular`
```python
stop_cellular()
```
The interface is stopped, all connections dropped, and all socket related to cellular interface closed.

### mehod `reset_cellular`
```python
reset_cellular()
```
The method resets the Cellular hardware module and the GNSS subsystem. The started
network connections should have been closed before, otherwise they could fall in
an inconsistent state.

### method `antenna_on`
```python
antenna_on()
```
The method powers the cellular modem antenna. The antenna is already powered by the `start_cellular` method.

### method `antenna_off`
```python
antenna_off()
```
The method shuts down the cellular modem antenna.

### method `get_status`
```python
get_status()
```
The method returns the value of the status pin of the cellular modem. The pin will be high when the module is on.

### method `get_psm_ind`
```python
get_psm_ind()
```
The method returns the value of the psm indicator pin. The pin will be low when in PSM.

### method `get_ring`
```python
get_ring()
```
The method returns the value of the ring pin. The pin will go low when the ring triggers.

### method `setup_ring_cb`
```python
setup_ring_cb(cb)
```
The method setup the call back function to be called when the ring triggers.

### method `get_dcd`
```python
get_dcd()
```
The method returns the value of the dcd pin.

### method `summary`
```python
summary()
```
Print the connect expansion summary on the console.

## Example
Please refer also to the cellular documentation.

```python
from expansions import connect
from bsp import board

board.init()

# Add the connect expansion
sel = (0,)
con_e = board.next_expansion(connect, sel)
# Start the cellular module and connect to the desired provider
cel = con_e.start_cellular(apn="my-provider-apn")
# Print info of the cell we connected to.
print(cel.cellinfo())
# Stop cellular module
con_e.stop_cellular()

while True:
    sleep(1000)
```
