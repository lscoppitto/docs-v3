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

## Exceptions

### exception `CellularException`
Generic cellular exception.

### exception `CellularModemInitError`
The modem initialization failed.

### exception `CellularModemConfigurationError,`
The modem not configured or configuration is not valid.

### exception `CellularInvalidStateError`
The modem or GNSS is in an invalid state.

### exception `CellularBadAPN`
The configured APN for PPP connection is not valid.

### exception `CellularCommandError`
The command sent to the modem or GNSS failed.

### exception `CantRegisterInterfaceError`
The cellular network interface cannot be registered.

### exception `ConnectionTimeoutError`
The cellular network connection start timed out.

### exception `GNSSException`
The exception related to GNSS submodule.

### exception `GNSSInitError`
The GNSS (Global Navigation Satellite System) submodule initialization failed.

### exception `GNSSTimeoutError`
The GNSS fix operation timed out.

## Functions

### function `configure`
```python
configure(apn="zerynth-apn", apn_user="", apn_password="", dhcp=True, ip="", mask="", gateway="", dns="8.8.8.8", timeout=10000, modem_type=BG95_M3, name="cellular", force_dns=False)
```
Configures the cellular interface with given arguments.

* `apn`: is the APN for the network connection. It depends from the SIM card provider. The default is the APN for a Zerynth SIM.
* `apn_user`: the username for the network connection authentication. Usually it is empty. Default value empty string.
* `apn_password`: the password for the network connection authentication. Usually it is empty. Default value empty string.

* `dhcp`: enable DHCP for IP parameters. Default value is *True*.
If `dhcp` is *True* `ip`, `mask`, `gateway`, `dns` arguments are ignored. ***Note*** For the `dns` see also the `force_dns` argument.
When `dhcp` is *False*, the arguments for IP parameters are:

* `ip`: is the static IP address. Default value is empty string.
* `mask`: the net mask expressed as A.B.C.D dotted address. Default value is empty string.
* `gateway`: the gateway IP address to be used as default router. Default value is empty string.
* `dns`: the Domain Name Server to be used for name resolution. When `dhcp` is *True* this parameter is ignored, unless `force_dns` is *True*. Default value is *"8.8.8.8"*, the Google DNS.

* `force_dns`: forces a custom DNS address when DHCP is on. When the `force_dns` is *True* the DNS address provided by the DHCP server is ignored. Default value is *False*.
* `timeout`: Connection timeout in milliseconds. `CellularException` is raised if connection do not succeed during this time. Default value is *10000* ms.
* `modem_type`: the Cellular hardware module type. Default value is *BG95_M3*.
* `name`: the interface name to be used in a multi interface scenario. Default value is *"cellular"*.

### function `init`
```python
init()
```
The function powers the Cellular hardware module up, and initializes it. The GNSS
subsystem is also initialized.

### function `deinit`
```python
deinit()
```
The function shuts the Cellular hardware module down, by also stopping all
eventually opened network connections. The GNSS subsystem is also shut down.

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
The function starts the network interface by initiating the PPP connection process and setting all IP parameters (address, routing, DNS, etc.).
The DHCP or static IP parameters are used depending upon the arguments passed to the `configure()` function.
If the cellular module is also initialized, should it was not done yet.

### function `stop`
```python
stop()
```
The interface is stopped, all connections dropped, and all socket related to cellular interface closed.

### function `resolve`
```python
resolve(host, name="cellular")
```
Resolves the symbolic name for the given `host` to its IP address by using the configured DNS server and returning a string with the result.
The `name` interface is used in a multi interface scenario. Default `name` value is "cellular".

### function `info`
```python
info(name="cellular")
```
Returns a tuple with the IP parameters associated with the `name`d interface. The tuple is composed by the following elements:

0. `Bool`: DHCP enabled (*True*) or disabled (*False*)
1. `String`: IP address
2. `String`: netmask
3. `String`: gateway
4. `String`: DNS
5. `String`: MAC address

### function `interface`
```python
interface(name="cellular")
```
Returns an integer for the index associated with the `name`d interface. Default `name` value is "cellular".

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
8. `Integer`: Operator MCC
9. `Integer`: Operator MNC
10. `String`: Operator name

The values meaning for the element *0* of the tuple, the connection state, are:

- `SEARCH`: the modem is not registered to any cell and is in searching mode
- `LIMSRV`: the modem has registered to the cell but cannot exchange data yet.
- `NOCONN`: the modem is in idle state. UE (User Equipment) has camped on a cell and registered on the network, but it is in the **idle** mode. This is the normal state when the modem is connected to the network.
- `CONNECT`: the modem is in the frame transmitting/receiving state.

The values meaning for the element *1* of the tuple, the access technology, are:

- `No Service`: the modem is not connected to the cell.
- `GSM`: the modem is connected using GSM technology.
- `GPRS`: the modem is connected using GPRS technology
- `EDGE`: the modem is connected using EDGE technology
- `eMTC`: the modem is connected using eMTC technology
- `NB-IoT`: the modem is connected using NB-IoT technology

## Classes

### Class `GNSS`

This class is used to interface with GNSS hardware submodule of the cellular system.
Note that the `start()` method has to be called in order to start the GNSS subsystem.

### Class methods

#### method `start`
```python
start()
```
This function initializes and sets the GNSS subsystem up.
Note that to perform a GPS fix, either the ```fix()``` or ```location()``` methods have to be called.

#### method `fix`
```python
fix(timeout=60)
```
The method runs the GPS fix and returns a tuple with the fixed data once the fix succeeds. 
The `timeout` argument is expressed in seconds and is the max amount of time to wait for the fix to complete. The default value is 60 seconds.
When the timeout expires, the *GNSSTimeoutError* exception is raised.

The returned tuple is composed by the following elements:

0. `Float`: The latitude expressed as (-)dd.ddddd degrees
1. `Float`: The longitude expressed as (-)ddd.ddddd degrees
2. `Float`: The horizontal dilution of precision 
3. `Float`: The altitude above/below mean sea level, expressed in meters.
4. `Integer`: GNSS positioning mode. *2*: 2D positioning, *3*: 3D positioning.
5. `Float`: Course Over Ground based on true north, expressed as ddd.mm (ddd: degrees, mm: minutes).
6. `Float`: Speed over ground, expressed as Km/h.
7. `Float`: Speed over ground, expressed as knots.
8. `Integer`: Number of fixed satellites.

**NOTE 1**: The Cellular hardware module on the [4ZeroBox Mobile](/latest/hardware/#4ZeroBox-mobile)
and on the [EXP-CONNECT board](/latest/hardware/EXP-CON/)
can use one of the GNSS or GSM subsystem at a time.
While the fix request is ongoing, the GSM connection gets suspended. Long
timeouts in a condition of low GNSS antenna reception may cause the GSM
connection to drop; the cellular software module will auto reconnect as soon
as it is possible after fix completes.
See also [disable() method](#method-disable) and [enable() method](#method-enable) to disable and enable the GNSS fix operations. 

**NOTE 2**: With the cellular hardware module on the [4ZeroBox Mobile](/latest/hardware/#4ZeroBox-mobile)
and on the [EXP-CONNECT board](/latest/hardware/EXP-CON/),
the very first fix done after the GNSS submodule startup may requires longer
time (at least 30 seconds, the better GNSS antenna reception, the shorter the
fix). Additional fixes done afterwards require shorter timings (at least 3 seconds).

#### method `location`
```python
location(timeout=60)
```
The method runs the GPS fix and returns a tuple with the location data once the fix succeeds. 
The `timeout` argument is expressed in seconds and is the max amount of time to wait for the fix to complete. The default value is 60 seconds.
When the timeout expires, the *GNSSTimeoutError* exception is raised.

The returned tuple is composed by the following elements:

0. `Float`: The latitude expressed as (-)dd.ddddd degrees
1. `Float`: The longitude expressed as (-)ddd.ddddd degrees
2. `Float`: The altitude above/below mean sea level, expressed in meters.

**NOTE**: see the [fix() method](#method-fix) notes for GNSS fix operation details.

#### method `disable`
```python
disable()
```
The method disables the GNSS fix. When the fix is disabled, the calls to `fix()` or `location()`
return with last known fix data, without doing any actual hardware fix operation.

#### method `enable`
```python
enable()
```
The method enables the GNSS fix operation. Note that on GNSS object creation the fix operation is enabled by default.

## Names

### `gnss`
```python
gnss
```
Pre-initialized Object for the `GNSS` class.

## Examples

### Using the cellular with 4ZeroBox Mobile:

```python
from bsp import board
from networking import cellular

board.init()
board.summary()

try:
    print("configuring cellular...")
    # Use a Zerynth SIM
    cellular.configure()
    print("initializing modem...")
    cellular.init()

    print("imei: ", cellular.imei())
    print("imsi: ", cellular.imsi())
    print("SIM ID: ", cellular.iccid())

    print("Initializing the GPS...")
    cellular.gnss.start()

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

    print("Get GPS data...")
    print("GPS :", cellular.gnss.fix())

    cellular.deinit()

except CellularBadAPN:
        print("Bad APN")
        cellular.stop()
        cellular.deinit()
except CellularException:
        print("Generic Cellular Exception")
        cellular.stop()
        cellular.deinit()
except GNSSTimeoutError:
        print("GPS fix timed out")
        cellular.deinit()
except Exception as e:
        print("Exception: ", e)
        cellular.stop()
        cellular.deinit()
        raise e

while True:
    sleep(1000)

```

### Using the cellular with ZM1-DB + EXP-CONNECT board

```python
from bsp import board
from networking import cellular

# Import the module for EXP-CONNECT board.
from expansions import connect

board.init()
board.summary()

# Initialize the EXP-CONNECT board.
board.next_expansion(connect, (0,))

try:
    print("configuring cellular...")
    # Use the APN for a custom SIM
    cellular.configure(apn="my-provider-apn")
    print("initializing modem...")
    cellular.init()

    print("IMEI: ", cellular.imei())
    print("IMSI: ", cellular.imsi())
    print("SIM ID: ", cellular.iccid())

    print("Initializing the GNSS...")
    cellular.gnss.start()

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

    print("Get GPS data...")
    print("GPS :", cellular.gnss.fix())

    cellular.deinit()

except CellularBadAPN:
        print("Bad APN")
        cellular.stop()
        cellular.deinit()
except CellularException:
        print("Generic Cellular Exception")
        cellular.stop()
        cellular.deinit()
except GNSSTimeoutError:
        print("GPS fix timed out")
        cellular.deinit()
except Exception as e:
        print("Exception: ", e)
        cellular.stop()
        cellular.deinit()
        raise e

while True:
    sleep(1000)

```
## Terms and Abbreviations

| Abbreviation | Description |
|------------|------------|
| APN    | Access Point Name                        |
| DHCP   | Dynamic Host Configuration Protocol      |
| DNS    | Domain Name Server                       |
| EDGE   | Enhanced Data rates for GSM Evolution    |
| GNSS   | Global navigation satellite system       |
| GPRS   | General Packet Radio Service             |
| GPS    | Global Positioning System                |
| GSM    | Global System for Mobile communications  |
| IMEI   | International Mobile Equipment Identity  |
| IMSI   | International Mobile Subscriber Identity |
| MAC    | Media Access Control                     |
| MCC    | Mobile Country Code                      |
| MNC    | Mobile Network Code                      |
| NB-IoT | Narrow Band for Internet of Things       |
| PPP    | Point-to-Point Protocol                  |
| RSSI   | Received Signal Strength Indicator       |
| SIM    | Subscriber Identity Module               |
| UE     | User Equipment                           |
| eMTC   | enhanced Machine Type Communication      |
