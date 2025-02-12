---
layout: blog
title: WiFi
---
## WiFi

This module implements a generic wifi interface.
To function correctly it needs a wifi driver to be loaded, so that the module can use the driver to access the underlying hardware.

The link between the wifi module and the wifi driver is established without the programmer intervention by the driver itself.

This module defines the following constants:

* `OPEN`            = 0; Open Wifi network
* `WEP`             = 1; Wifi Network secured with WEP
* `WPA`             = 2; Wifi Network secured with WPA
* `WPA2`            = 3; Wifi Network secured with WPA2
* `WPA_WPA2`        = 4; Wifi Network secured with WPA or WPA2
* `WPA2_ENTERPRISE` = 5; Wifi Network secured with WPA2 enterprise
* `WPA3`            = 6; Wifi Network secured with WPA3
* `WPA2_WPA3`       = 7; Wifi Network secured with WPA2 or WPA3

## Exception

### exception `WifiException`
Generic exception

### exception `WifiBadPassword`
The configured password is not correct.

### exception `WifiBadSSID`
The configured SSID is not available between visible WiFi networks.

## Functions

### function `configure`
```python
configure(ssid="", password="", security=WPA_WPA2, dhcp=True, ip="", mask="", gateway="", dns="8.8.8.8", timeout=10000, ent_user="", ent_pwd="", hostname="", name="wifi", force_dns=False)
```
Configures the wifi interface with given arguments.

* `ssid` is the WiFi name to associate to.
* `password` the the shared secret for the `ssid` network.
* `security` is the encryption type to be used.

* `dhcp`: enable DHCP for IP parameters. Default value is *True*.
If `dhcp` is *True* `ip`, `mask`, `gateway`, `dns` arguments are ignored. ***Note*** For the `dns` see also the `force_dns` argument.
When `dhcp` is *False*, the arguments for IP parameters are:

* `ip`: is the static IP address. Default value is empty string.
* `mask`: the net mask expressed as A.B.C.D dotted address. Default value is empty string.
* `gateway`: the gateway IP address to be used as default router. Default value is empty string.
* `dns`: the Domain Name Server to be used for name resolution. When `dhcp` is *True* this parameter is ignored, unless `force_dns` is *True*. Default value is *"8.8.8.8"*, the Google DNS.

* `force_dns`: forces a custom DNS address when DHCP is on. When the `force_dns` is *True* the DNS address provided by the DHCP server is ignored. Default value is *False*.

* `timeout`: Connection timeout in milliseconds. `WifiException` is raised if connection do not succeed during this time. Default value is *10000* ms.
* `name`: the interface name to be used in a multi interface scenario. Default value is *"wifi"*.
* `hostname`: hostname associated with the interface. When the `hostname` is empty string, the dcn (Device Common Name) is used as hostname. Default value "".

If the `security` is *WPA2_ENTERPRISE* (a.k.a. WPA-802.1X), the following parameters are used to specify the Extensible Authentication Protocol (EAP) attributes. Only PEAP is supported.
If the `security` is set to other values, the following parameters are ignored.

* `ent_user`: the username to be used for the authentication. Default value is empty string.
* `ent_pwd`: the password to be used for the authentication. Default value is empty string.

### function `start`
```python
start()
```
The function starts the interface by initiating the WiFi association process and stating the DHCP configuration and other IP setups (routing, DNS, etc.).
The DHCP or static IP parameters are used depending upon the arguments passed to the `configure()` function.

### function `stop`
```python
stop()
```
The interface is stopped, all connections dropped, and all socket closed related to wifi interface.

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

### function `ap_info`
```python
ap_info()
```
Returns a tuple with the AP parameters the WiFi interface is associated with. The tuple is composed by the following elements:

0. `String`: The SSID of the AP
1. `Integer`: The channel number
2. `Integer`: The signal strength
3. `Integer`: The security mode as described above in the *security* parameter of `configure` function.
4. `String`: The BSSID of the AP in hexadecimal notation (e.g.: *10:20:30:40:50:60*).

If the WiFi interface is not associated with any AP, the PeripheralError exception will be raised.

### function `scan`
```python
scan(ssid=None)
```
Start a scan over WIFI access points. The function will return when the scan is completed, which can take up to 1.5 seconds per scanned channel.

* `ssid` is the target ssid to scan. If `None` all the found AP will be saved, otherwise only the ones matching with `ssid`.

### function `get_ap_num`
```python
get_ap_num()
```
Returns the number of APs found during the scan.

### function `get_ap_records`
```python
get_ap_records(n)
```
Returns a list of tuples with all recorded APs' data.

* `n` is the number of APs tuples to be returned.

Return a list of tuples with the following format (`ssid`, `channel`, `rssi`, `auth mode`, `bssid`).
The tuple is composed by the following elements:

0. `String`: The SSID of the AP
1. `Integer`: The channel number
2. `Integer`: The signal strength
3. `Integer`: The security mode as described above in the *security* parameter of `configure` function.
4. `String`: The BSSID of the AP in hexadecimal notation (e.g.: *10:20:30:40:50:60*).

### function `get_rssi`
```python
get_rssi(ssid=None)
```
Returns the `rssi` of the specified `ssid`. If `ssid` is `None` the rssi of the currently associeted net is returned, otherwise a scan is executed before returning the `rssi`, this can require some seconds.

### function `scan_and_get`
```python
scan_and_get(ssid=None)
```
Start a scan over WIFI access points, returning a list of tuples with all recorded APs' data when the scan is over. This can take up to 1.5 seconds per scanned channel.

* `ssid` is the target ssid to scan. If `None` all the found AP will be saved, otherwise only the ones matching with `ssid`.

Return a list of tuples with the following format (`ssid`, `channel`, `rssi`, `auth mode`, `bssid`).
The tuple is composed by the following elements:

0. `String`: The SSID of the AP
1. `Integer`: The channel number
2. `Integer`: The signal strength
3. `Integer`: The security mode as described above in the *security* parameter of `configure` function.
4. `String`: The BSSID of the AP in hexadecimal notation (e.g.: *10:20:30:40:50:60*).

## Examples

Using the wifi module is very easy:

```python
from bsp import board

from networking import wifi

board.init()
board.summary()

try:
    # Configure WiFi to use dhcp with a specific network
    wifi.configure(ssid="My-Network",password="My-Password")
    # Start the interface
    wifi.start()
    # Print the ip, gateway, mask, dns and mac address
    print(wifi.info())
    # Try resolving some hostname via dns
    ip=wifi.resolve("www.zerynth.com")
    print("resolved",ip)
    # sleep a little bit
    sleep(5000)
    # disable wifi
    wifi.stop()

except WifiBadPassword:
    print("Bad Password")
except WifiBadSSID:
    print("Bad SSID")
except WifiException:
    print("Generic Wifi Exception")
except Exception as e:
    raise e



while True:
    sleep(1000)

```


More configuration is also available:

```python
from bsp import board

from networking import wifi

board.init()
board.summary()

try:
    # Configure WiFi to use dhcp with a specific network and security
    wifi.configure(ssid="My-Network",password="My-Password", security=wifi.WPA)
    # Start the interface
    wifi.start()
    # Print the ip, gateway, mask, dns and mac address
    print(wifi.info())
    # Try resolving some hostname via dns
    ip=wifi.resolve("www.zerynth.com")
    print("resolved",ip)
    # sleep a little bit
    sleep(5000)
    # disable wifi
    wifi.stop()

except WifiBadPassword:
    print("Bad Password")
except WifiBadSSID:
    print("Bad SSID")
except WifiException:
    print("Generic Wifi Exception")
except Exception as e:
    raise e



while True:
    sleep(1000)

```

Using WiFi with WPA2 Enterprise

```python
from bsp import board

from networking import wifi

board.init()
board.summary()

try:
    # Configure WiFi to use dhcp with a specific network and security
    print("configuring...")
    ssid = "WiFi Enterprise"

    wifi.configure(
            ssid=ssid,
            security=wifi.WPA2_ENTERPRISE,
            ent_user="test_usr", ent_pwd="test_pwd",
            timeout=10000)

    # Start the interface
    print("connecting...")
    wifi.start()
    print("connected...")
    # Print the ip, gateway, mask, dns and mac address
    print("info...")
    print(wifi.info())
    # Try resolving some hostname via dns
    ip=wifi.resolve("www.zerynth.com")
    print("resolved", ip)
    # sleep a little bit
    sleep(5000)
    # disable wifi
    wifi.stop()

except Exception as e:
    print(e)

while True:
    sleep(1000)

```
