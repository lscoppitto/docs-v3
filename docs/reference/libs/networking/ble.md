---
layout: blog
title: Ble
---
### Ble

This module implements a Bluetooth Low Energy interface.
To function correctly it needs a version of the OS with the `specs` bluetooth enabled. Those can be specified in the `project.yml` of the project adding a `b` on the specs (e.g. `zfb`).

## Exceptions

### exception `BleException`
Generic ble exception.

### exception `BleInitError`
The ble initialization failed.

### exception `BleDriverError`
The ble's undergoing drivers failed.

### exception `BleDeviceNotFoundError`
The ble could not discover the searched device.

### exceptuin `BleReadOverflowError`
The ble read operation overflowed the size of read buffers.

## Class BLE

### class `BLE`
```python
BLE()
```
This class represents a Bluetooth Low Energy device.
Raise `__builtins__.UnsupportedError` exception if the selcted OS does not have bluetooth enabled on specs.

### method `init`
```python
init(timeout=10000)
```
Initialize the ble drivers and tries to sync to the network.
The device will try to sync to the network for `timeout` milliseconds.

### method `discover`
```python
discover(name, timeout=10000)
```
Discover ble devices on the network and search for the one specified on `name`. The device will try to discover the selected device for `timeout` milliseconds.
Returns a tuple with info on the address of the discover device. The tuple is composed by the following elements:
0. `Address_Type`: the type of address of the discover device
1. `Address_Value`: address of the discover device

### method `connect`
```python
connect(addr_type, addr, timeout=10000)
```
Connect to the device on the network with the specified `addr_type` and `addr` address. `addr_type` and `addr` are returned by the `discover` method if the device is discovered. The device will try to connect to the selected device for `timeout` milliseconds.

### method `convert_uuid`
```python
convert_uuid(uuid, n_bytes)
```
Converts an `uuid` of `n_bytes` on a bytearray of `n_bytes`.
This method can be used to quickly convert 16 and 32 bit uuid of the Generic Attribute Profile Client.
Returns a bytearray with the converted `uuid`.

### method `read_gattc`
```python
read_gattc(svc_uuid, chr_uuid, dsc_uuid, n_buf=1, max_lengths=(64,), timeout=10000)
```
Read the value of a gattc service characteristic or descriptor. The service is specified by the `svc_uuid`, the characteristic by `chr_uuid` and the descriptor by `dsc_uuid`. If `dsc_uuid` is `None` the characteristic value will be read instead of the descriptor. All uuids should be bytearrays of 2 bytes (16 bits), 4 bytes (32 bits) or 16 bytes (128 bits), `convert_uuid` method can be used for this.
This method will read up to `n_buf` buffers each with a maximum length equals to the element of `max_lengths` tuple.
The device will try to read from the selected device for `timeout` milliseconds.
Returns a list with the read values stored on a maximum of `n_buf` bytearrays.

### method `write_gattc`
```python
write_gattc(svc_uuid, chr_uuid, dsc_uuid, buf_list, timeout=10000)
```
Write the value of a gattc service characteristic or descriptor. The service is specified by the `svc_uuid`, the characteristic by `chr_uuid` and the descriptor by `dsc_uuid`. If `dsc_uuid` is `None` the characteristic value will be wrote instead of the descriptor. All uuids should be bytearrays of 2 bytes (16 bits), 4 bytes (32 bits) or 16 bytes (128 bits), `convert_uuid` method can be used for this.
This method will write all the bytearrays on the list `buf_list`.
The device will try to write from the selected device for `timeout` milliseconds.

### method `notify_cb_attach`
```python
notify_cb_attach(fn)
```
Attach a the specified `fn` as callback to the notify event. Arguments not supported yet.

### method `disconnect`
```python
disconnect(timeout=10000)
```
Disconnect from the connected device. The device will try to disconnect from the selected device for `timeout` milliseconds.

### method `deinit`
```python
deinit()
```
Deinitialize the ble driver.

### method `scan`
```python
scan(name=None, timeout=10000)
```
Scan for BLE devices, scan will go on until `timeout` is reached. If `name` is not `None` the driver will filter and keep only devices with name starting with `name`.
Scanned list can be obtained with method `scan_list`.

### method `scan_list`
```python
scan_list(max_dev=0)
```
Get previously scanned list of BLE devices. If `max_dev` is not `0` the list will contain up to `max_dev` devices.
The returned list is a list of lists, each with the following data:
`[name, adv_data, address, rssi]`
0. `name` a string with the device name;
1. `adv_data` a buffer of bytes with advertising data of the device;
2. `address` address of the device on the network. This is the list described in the `discover` method;
3. `rssi` is the rssi value of the device.
