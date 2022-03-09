---
layout: blog
title: Omron FINS
---
## Omron FINS Library

Introduction

This module defines the following constants:

* `UDP` = 0; UDP protocol
* `TCP` = 1; TCP protocol

* `RAW`   = 0; RAW data format for read/write operations
* `BCD16` = 1; BCD16 data format for read/write operations
* `BCD32` = 2; BCD32 data format for read/write operations
* `BIT`   = 3; Boolean data format for read/write operations
* `INT16` = 4; INT16 data format for read/write operations
* `INT32` = 5; INT32 data format for read/write operations

## Exceptions

### exception `FinsError`
Generic Fins error.

### exception `FinsLocalError`
Generic local node error.

### exception `FinsRemoteError`
Generic destination node connection error.

### exception `FinsControllerError`
Generic network controller error.

### exception `FinsUnsupportedError`
Unsupported command error.

### exception `FinsRoutingError`
Destination node routing error.

### exception `FinsCommandFormatError`
Command malformed error.

### exception `FinsParamError`
Command parameter error.

### exception `FinsRDError`
Destination node read error.

### exception `FinsWRError`
Destination node write error.

### exception `FinsModeError`
Destination node is not in the correct mode during command execution.

### exception `FinsDeviceError`
Generic device error on destination node.

### exception `FinsDatalinkError`
Data link table missing or corrupt.

### exception `FinsUnitError`
Generic unit error on destination node.

### exception `FinsCommandError`
Command execution error on destination node.

### exception `FinsAccessError`
No access right.

### exception `FinsAbortedError`
Service aborted.

### exception `FinsConnectionError`
Connection error with the destination node.

### exception `FinsAddressError`
Memory address is invalid.

### exception `FinsMiscError`
Generic miscellaneous error.

### exception `FinsCanceledError`
Operation canceled error.

### exception `FinsUnknownError`
Unknown error.


## Fins class
```python
Fins(address, port=9600, local_net=0, local_node=0, local_unit=0, remote_net=0, remote_node=0, remote_unit=0, proto=UDP, retries=3, model="CS")
```
The class is used to create Fins clients. The parameters are:

* `address` is the remote node IPv4 address (String).
* `port` is the remote node TCP/UDP port (Integer). Default: *9600*
* `local_net` the local net number (Integer). Default: *0*
* `local_node` the local node number (Integer). Default: *0*
* `local_unit`  the local unit number (Integer). Default: *0*
* `remote_net` the remote net number (Integer). Default: *0*
* `remote_node` the remote node number (Integer). Default: *0*
* `remote_unit` the remote unit number (Integer). Default: *0*
* `proto` the protocol type, can be *fins.TCP* or *fins.UDP*. Default: *fins.UDP*
* `retries` the number of retries to attempt the connection to remote node (Integer). Default: *3*
* `model` the remote node model (String). Default: *"CS"*

### Method `connect`
```python
connect()
```
Establishes the connection between defined client and remote endpoint.


### Method `clock`
```python
clock()
```
Returns the current time of the remote endpoint as a tuple composed by following elements:

0. `Integer`: year
1. `Integer`: month
2. `Integer`: day
3. `Integer`: hour
4. `Integer`: min
5. `Integer`: seconds
6. `Integer`: day of the week

### Method `memory_area_read`
```python
memory_area_read(area, address, size, format=RAW)
```
Reads the memory location on the remote node.
The returned data format depends on the specified `format`
The parameters are:

* `area`: is the memory area
* `address`: is the memory address
* `size`: is the amount of word (16 bits) to read.
* `format` is the format of the data to read. Default is `fins.RAW`

### Method `memory_area_write`
```python
memory_area_write(area, address, size, data, format=RAW)
```
Writes the memory location on the remote node with specified data.
The parameters are:

* `area`: is the memory area
* `address`: is the memory address
* `size`: is the amount of word (16 bits) to read.
* `data`: the data to be written. The format depends on `format` parameter.
* `format` is the format of the data to read. Default is `fins.RAW`
