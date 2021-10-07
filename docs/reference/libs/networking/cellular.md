---
layout: blog
title: Cellular
---
## Cellular

This module implements a generic Cellular interface.
To function correctly it needs a cellular driver to be loaded, so that the module can use the driver to access the underlying hardware.

The link between the cellular module and the cellular driver is established without the programmer intervention by the driver itself.

This module defines the following constants:

* `BG95_M3` = 0; Quectel BG95-M3 Cellular module as modem type.
* `BG96`    = 1; Quectel BG96 Cellular module as modem type.

## Exception

### exception `CellularException`
Generic exception

### exception `CellularBadAPN`
The configured APN for PPP connection is not valid.

### exception `CellularModemInitError`
The modem initialization failed.

### exception `CellularGNSSInitError`
The GNSS (Global Navigation Satellite System) submodule initialization failed.

### exception `CellularInvalidStateError`
The modem or GNSS is in an invalid state.

### exception `CellularCommandError`
The command sent to the modem or GNSS failed.

### exception `CellularTimeoutError`
The command sent to the modem or GNSS failed.

## Functions

### function `configure`
```python
configure(apn="", apn_user="", apn_password="", dhcp=True, ip="", mask="", gateway="", dns="8.8.8.8", timeout=10000, modem_type=BG95_M3)
```
Configures the cellular interface with given arguments.

* `apn`: is the APN for the network connection. It depends from the SIM card provider.
* `apn_user`: the username for the network connection authentication. Usually it is empty.
* `apn_password`: the password for the network connection authentication. Usually it is empty.

If `dhcp` is *True* (the default) other following arguments are ignored.
When `dhcp` is *False*, the other arguments are:

* `ip`: is the IP address.
* `mask`: the net mask expressed as A.B.C.D dotted address.
* `gateway`: the gateway to be used as default router.
* `dns`: the Domain Name Server to be used for name resolution. Default is "8.8.8.8", the Google DNS.

* `timeout`: Connection timeout in milliseconds. `CellularException` is raised if connection do not succeed during this time. Default value 10000 ms.
* `modem_type`: the Cellular hardware module type. Default value BG95_M3.

### function `init`
```python
init()
```
The function powers the Cellular hardware module and initializes it. The GNSS
subsystem is also initialized.

### function `deinit`
```python
deinit()
```
The function shuts the Cellular hardware module down, by also stopping all
eventually opend network connections. The GNSS subsystem is also shutted down.

### function `reset`
```python
reset()
```
The function resets the Cellular hardware module and the GNSS subsystem. The started
network connections should have been closed before, otherwise they could fall in
an inconsistent state.

### function `start`
```python
start()
```
The function starts the interface by initiating the PPP startup process and stating the DHCP configuration and other IP setups (routing, DNS, etc.).
The DHCP or static IP parameters are used depending upon the arguments passed to the `configure()` function.

### function `stop`
```python
stop()
```
The interface is stopped, all connections dropped, and all socket closed related to cellular interface.

### function `resolve`
```python
resolve(host)
```
Resolves the symbolic name for the given `host` to its IP address by using the configured DNS server and returning a string with the result.

### function `info`
```python
info()
```
Returns a tuple with the IP parameters associated with the interface. The tuple is composed by the following elements:

0. `Bool`: DHCP enabled (*True*) or disabled (*False*)
1. `String`: IP address
2. `String`: netmask
3. `String`: gateway
4. `String`: DNS
5. `String`: MAC address

### function `atmode`
```python
atmode()
```
The function sets the modem in AT command mode.

### function `pppmode`
```python
pppmode()
```
The function sets the modem in PPP data mode.

### function `imei`
```python
imei()
```
The function returns the modem IMEI (International Mobile Equipment Identity) as `String`.

### function `imsi`
```python
imsi()
```
The function returns the modem IMSI (International Mobile Subscriber Identity) as `String`.

### function `iccid`
```python
iccid()
```
The function returns the SIM card identifier as `String`.

### function `rssi`
```python
rssi()
```
The function returns the Cellular signal RSSI (Received Signal Strength Indicator)
value expressed in dBm in the range -113, -51. A valid value is always
negative.
A returned value of *99* means the signal strength is too low or undetectable.

### function `cellinfo`
```python
cellinfo()
```
The function returns a tuple with the Cellular cell information the modem is connected to. The tuple is composed by the following elements:

0. `String`: The state of the modem connection. Can be: *SEARCH*, *LIMSRV*, *NOCONN*, *CONNECT*.
1. `String`: Access technology. Can be: *No Service*, *GSM*, *GPRS*, *EDGE*, *eMTC*, *NB-IoT*.
2. `String`: Operator code. 3 chars for MCC, 3 chars for MNC.
3. `String`: Selected band
4. `Integer`: Channel ID
5. `Integer`: Local Area Code
6. `Integer`: Cell ID
7. `Integer`: Base station ID code

The values meaning for the element *0* of the tuple, the connection state, are:

- `SEARCH`: the modem is not registered to any cell and is in searching mode
- `LIMSRV`: the modem has registered to the cell but cannot exchange data yet.
- `NOCONN`: the modem is in idle state. UE (User Equipment) has camped on a cell and registered on the network, but it is in the idle mode. This is the normal state when the modem is connected to the network.
- `CONNECT`: the modem is in the transmitting/receiving state.

The values meaning for the element *1* of the tuple, the access tecnology, are:

- `No Service`: the modem is not connected to the cell.
- `GSM`: the modem is connected using GSM technology.
- `GPRS`: the modem is connected using GPRS technology
- `EDGE`: the modem is connected using EDGE technology
- `eMTC`: the modem is connected using eMTC technology
- `NB-IoT`: the modem is connected using NB-IoT technology

### function `gps_start`
```python
gps_start()
```
This function initialize and sets up the GNSS subsystem.
Note that to perform a GPS fix, the ```location()``` function has to be called.

### function `location`
```python
location(timeout=60)
```
The function runs the GPS fix and return a tuble with the location data once the fix succeeds. 
The `timeout` argument is expressed in seconds and is the max amount of time to wait for the fix to complete. The default value is 60 seconds.
When the timeout expires, the *CellularTimeoutError* exception is raised.

The tuple is composed by the following elements:

0. `Float`: The latitude expressed as (-)dd.ddddd degrees
1. `Float`: The longitude expressed as (-)ddd.ddddd degrees
2. `Float`: The horizontal dilution of precision 
3. `Float`: The altitude above/below mean sea level, expressed in meters.
4. `Integer`: GNSS positioning mode. *2*: 2D positioning, *3*: 3D positioning.
5. `Float`: Course Over Ground based on true north, expressed as ddd.mm (ddd: degrees, mm: minutes).
6. `Float`: Speed over ground, expressed as Km/h.
7. `Float`: Speed over ground, expressed as knots.
8. `Integer`: Number of fixed satellites.

## Examples

Using the cellular module is very easy:

```python
from bsp import board
from networking import cellular

board.init()
board.summary()

try:
    print("configuring cellular...")
    cellular.configure(apn="my-provider-apn")
    print("initializing modem...")
    cellular.init()

    print("imei: ", cellular.imei())
    print("imsi: ", cellular.imsi())
    print("SIM ID: ", cellular.iccid())

    print("Initializing the GPS...")
    cellular.gps_start()

    print("connecting...")
    cellular.start()
    print("connected!")
    print("ppp info: :", cellular.info())

    print("cell info: ", cellular.cellinfo())

    ip=cellular.resolve("www.zerynth.com")
    print("www.zerynth.com resolved ip: ", ip)

    # sleep a little bit
    sleep(5000)

    print("Disconnecting...")
    cellular.stop()
    print("Disconnected!")

    print("GPS :", cellular.location())

    cellular.deinit()

except CellularBadAPN:
        print("Bad APN")
        cellular.stop()
        cellular.deinit()
except CellularTimeoutError:
        print("GPS fix timed out")
        cellular.stop()
        cellular.deinit()
except CellularException:
        print("Generic Cellular Exception")
        cellular.stop()
        cellular.deinit()
except Exception as e:
        print("Exception: ", e)
        cellular.stop()
        cellular.deinit()
        raise e

while True:
    sleep(1000)

```
