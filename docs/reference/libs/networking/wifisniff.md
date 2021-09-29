---
layout: blog
title: WiFi Sniffer
---
## WiFi Sniffer

This module implements a wifi sniffer. A sniffer is a utility to monitor and capture data packets on the WiFi network without connecting to the network itself.
To function correctly it needs a wifi driver to be loaded, so that the module can use the driver to access the underlying hardware.

The link between the wifi module and the wifi driver is established without the programmer intervention by the driver itself.

## Sniffer architecture

A Ring buffer holds sniffed packets interesting data (hdr, rssi, channel, payload size, payload pointer)

Packets are first filtered in the OS callback by checking subtypes and direction.
If the subfilter passes, they are put into the ring buffer. If it is full,
packets starts to be discarded.
If there is enough memory from the payload memory pool, the payload is copied
into newly allocated memory.
Otherwise only the hdr is saved into the ring buffer.

Packets are removed from the ring buffer when polled by python. Upon removal from ring buffer, the payload memory is freed.

The implementation IS NOT THREAD SAFE = only one Python thread at a time can call the `sniff()` function.

## Constants

### Frame Types

`WIFI_PKT_MGMT = 0`: Management Frame

`WIFI_PKT_CTRL = 1`: Control Frame

`WIFI_PKT_DATA = 2`: Data Frame

### Frame Subtypes

`WIFI_PKT_MGMT_ASSOC_REQ   = 0`

`WIFI_PKT_MGMT_ASSOC_RES   = 1`

`WIFI_PKT_MGMT_REASSOC_REQ = 2`

`WIFI_PKT_MGMT_REASSOC_RES = 3`

`WIFI_PKT_MGMT_PROBE_REQ   = 4`

`WIFI_PKT_MGMT_BEACON      = 8`

`WIFI_PKT_MGMT_ATIM        = 9`

`WIFI_PKT_MGMT_DISASSOC    = 10`

`WIFI_PKT_MGMT_AUTH        = 11`

`WIFI_PKT_MGMT_DEAUTH      = 12`

`WIFI_PKT_MGMT_ACTION      = 13`

`WIFI_PKT_MGMT_ACTION_NACK = 14`

### Control Frame types

`WIFI_PKT_CTRL_PSPOLL    = 10`

`WIFI_PKT_CTRL_RTS       = 11`

`WIFI_PKT_CTRL_CTS       = 12`

`WIFI_PKT_CTRL_ACK       = 13`

`WIFI_PKT_CTRL_CFEND     = 14`

`WIFI_PKT_CTRL_CFEND_ACK = 15`

### Data Frame types

`WIFI_PKT_DATA_DATA                = 0`

`WIFI_PKT_DATA_DATA_CFACK          = 1`

`WIFI_PKT_DATA_DATA_CFPOLL         = 2`

`WIFI_PKT_DATA_DATA_CFPOLL_ACK     = 3`

`WIFI_PKT_DATA_NULLDATA            = 4`

`WIFI_PKT_DATA_NULLDATA_CFACK      = 5`

`WIFI_PKT_DATA_NULLDATA_CFPOLL     = 6`

`WIFI_PKT_DATA_NULLDATA_CFPOLL_ACK = 7`

`WIFI_PKT_DATA_QOS                 = 8`

`WIFI_PKT_DATA_QOS_CFACK           = 9`

`WIFI_PKT_DATA_QOS_CFPOLL          = 10`

`WIFI_PKT_DATA_QOS_CFPOLL_ACK      = 11`

`WIFI_PKT_DATA_NULLQOS             = 12`

`WIFI_PKT_DATA_NULLQOS_CFPOLL      = 14`

`WIFI_PKT_DATA_QOS_CFPOLL_ACK      = 15`

## Functions

### function `configure`
```python
configure(packet_types=(),
          direction=0xf,
          channels=(),
          mgmt_subtypes=(),
          ctrl_subtypes=(),
          data_subtypes=(),
          hop_time=5000,
          max_packets=32,
          max_payload_memory=0)
```
Configures the wifi sniffer with given arguments.

* `pkt_types` : List of types of packets to be captured (Management, Control, Data).
* `direction` : Bit mask for direction of packets to be captured: FromDS bit0, ToDS bit1.
* `channels` : List of channels to be scanned.
* `mgmt_subtypes` : List of management subtypes to be captured.
* `ctrl_subtypes` : List of control subtypes to be captured.
* `data_subtypes` : List of data subtypes to be captured.
* `hop_time` : Time to spend parsing each channel (in ms).
* `max_packets` : Max number of packets to be stored in the ring buffer.
* `max_payload_memory` : Max memory in bytes to allocate for all packets in the ring buffer.

### function `start`
```python
start()
```
Starts the packet sniffing.

### function `stop`
```python
stop()
```
Stops the packet sniffing.

### function `sniff`
```python
sniff(n=1, hex=True, wait=500)
```
Returns `n` sniffed packets so far. If `n`=*-1*, returns all sniffed packets.

`hex`=*True*, the function returns MAC addresses in hexadecimal format, otherwhise as a bytearray.

`wait` is the time in milliseconds to wait for the `n` packets to be sniffed.

**Note**: the watchdog is not kicked during the `wait` period. Be sure the `wait` is
shorter then the watchdog firing time.

The sniffed packets are returned as a list. Each list element contains a list of packet parameters, composed as in the following.

0. `Integer`: The packet type. See [Frame types](#frame-types)
1. `Integer`: The packet subtype. See [Frame Subtypes](#frame-subtypes)
2. `Integer`: ToDS, a flag indicating the packet is transmitted from wireles station to the distribution system (DS).
3. `Integer`: FromDS, a flag indicating the packet is transmitted from the distribution system (DS) to the wireles station.
4. `Integer`: The flags of the control frame.
5. `Integer`: The frame duration or ID. It indicates the time (in microseconds)
the channel will be allocated for successful transmission of a MAC frame. In
some control frames, this field contains an association, or connection,
identifier.
6. `Integer`: The Sequence Control number. It contains a 4-bit fragment number
subfield, used for fragmentation and reassembly, and a 12-bit sequence number
used to number frames sent between a given transmitter and receiver.
7. `String`|`Bytearray`: MAC address 1. The data type is determined by the `hex` parameter. See the table below for the meaning of the address.
8. `String`|`Bytearray`: MAC address 2. The data type is determined by the `hex` parameter. See the table below for the meaning of the address.
9. `String`|`Bytearray`: MAC address 3. The data type is determined by the `hex` parameter. See the table below for the meaning of the address.
10. `String`|`Bytearray`: MAC address 4. The data type is determined by the `hex` parameter. See the table below for the meaning of the address.
11. `Integer`: RSSI (Received Signal Strength Indication) value.
12. `Integer`: Channel number.
13. `Integer`: Payload size.

The meaning of the four MAC addresses returned depends on the `ToDS` and `FromDS` fields, as described in the following table.

|ToDS|FromDS|Address 1|Address 2|Address 3|Address 4|
|:--:|:----:|:-------:|:-------:|:-------:|:-------:|
|0   |0     |RA=DA    |TA=SA    |BSSID    |N/A      |
|0   |1     |RA=DA    |TA=BSSID |SA       |N/A      |
|1   |0     |RA=BSSID |TA=SA    |DA       |N/A      |
|1   |1     |RA       |TA       |DA       |SA       |

Legend

* Receiver Address (RA)
* Transmitter Address (TA)
* Basic Service Set Identifier (BSSID)
* Destination Address (DA)
* Source Address (SA)

## Examples

### Example 1

The following example configures the sniffer with default parameters, starts it
and loops forever printing the sniffed packets. Each sniff() call waits 500ms
to collect the required packets.

```python
from networking import wifisniff as sniffer

sniffer.configure()

sniffer.start()

# loop forever
while True:
    # print something
    print("Sniffing...")
    # wait 500ms to sniff packets, get and print them all
    for pkt in sniffer.sniff(n=-1, wait=500):
        print(pkt)
    # sleep 1 second
    sleep(1000)
```

### Example 2

The following example configures the sniffer with default parameters, starts it
and loops forever printing the sniffed packets.
Each sniff() call returns immediately with all collected packets so far, if any.

```python
from networking import wifisniff as sniffer

sniffer.configure()

sniffer.start()

# loop forever
while True:
    # print something
    print("Sniffing...")
    # get all packets sniffed so far and print them
    for pkt in sniffer.sniff(n=-1, wait=0):
        print(pkt)
    # sleep 1 second
    sleep(1000)
```
