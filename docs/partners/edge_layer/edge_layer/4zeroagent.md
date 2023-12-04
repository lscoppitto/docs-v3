# 4ZeroAgent

The 4ZeroAgent is designed to run seamlessly on any PC or server, providing advanced performance, scalability, and flexibility.
It can be easily deployed on any hardware or IT infrastructure supporting container technology, making the integration effortless and giving you the freedom to choose the best hardware for your unique needs.

## Docker

To run the 4ZeroAgent inside a container, you need a PC/server running either a Linux distribution with docker installed or Windows with [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install){:target="_blank"} and [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/){:target="_blank"} installed.

**Please note:** on a Windows host, virtualization must be enabled.

A docker installation is suitable for:

* Reading and writing from an OPC-UA server (see [OT Jobs](../../machines_connection_and_management/machines_connection_and_management/cloud_to_machine_command_sending.md){:target="_blank"})
* Reading from a tcp Modbus server
* Reading from an S7 server
* Running tasks that do not require direct access to the host hardware (e.g. GPIO pins or serial interfaces)
* Running jobs that do not require direct access to the host hardware

This setup is perfect to monitor and control modern machines that operates only via OT protocols.
Furthermore, in a containerized environment, it is also possible to run multiple 4ZeroAgent instances on the same server in order to monitor and control multiple machines with just one physical device.

## Physical Node

Alternatively to docker, the 4ZeroAgent can run on a supported 4ZeroNode adding the following capabilities to the Agent:

* Reading from amperometric clamps
* Communicating through a serial interface (RS232 and RS485 are both supported)
* Reading from an RTU Modbus server
* Reading from both analog and digital sensors

This setup is suitable to monitor both legacy and modern machines, but it possible to run only one agent per node, so the monitoring of multiple machines requires the installation of multiple physical nodes.

Check [here](./iot_industrial_kit/advanced.md){:target="_blank"} to get further information on our 4ZeroNodes.