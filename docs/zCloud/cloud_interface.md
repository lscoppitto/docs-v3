# Zerynth Cloud application
## Workspaces

A **Workspace** is a group of devices, single fleet or multiple fleets of devices. You can imagine the workspace as the main folder of your project or your product.
The workspace menu is contextual and remembers the latest section you visited. Workspaces are also searchable for easy navigation across many projects.


<figure>
  <a data-fancybox="gallery" href="../img/zcloud1.jpg">
  <img src="../img/zcloud1.jpg"/>
  </a>
</figure>

## Device Management
### Devices

This page serves as main overview of the fleets or devices inside the workspace. It provides information such as device name, device ID and connection status of each device and the provisioning status of each device.
Users can view single or multiple fleets and can search across devices and fleets with name or ID.



<figure>
  <a data-fancybox="gallery" href="../img/zcloud2.png">
  <img src="../img/zcloud2.png"/>
  </a>
</figure>


### Device 

This page serves as the main control panel for the device. It consists of an Overview section with relevant information on the device operation as well as Jobs&FOTA section for issuing RPCs, Activity and Console pages for monitoring data and operations and File System for a detailed view of the device's files.

**Overview** 

It contains the main device's information such as 

* Device connection status, last disconnection and communication statistics.
* Timeseries graph of recent data activity
* Status of the latest FOTA and Job issued.
* Cellular and GPS activity


<figure>
  <a data-fancybox="gallery" href="../img/zcloud3a.png">
  <img src="../img/zcloud3a.png"/>
  </a>
</figure>

**Jobs & FOTA** 

This section shows some information about the latest Jobs and FOTAs, with the description of their status and the device response.

FOTAs can be currently scheduled on single devices or multiple fleets or - if the filters are not set - the entire workspace.

<figure>
  <a data-fancybox="gallery" href="../img/zcloudFota.png">
  <img src="../img/zcloudFota.png"/>
  </a>
</figure>

**Activity** 

This section allows you to explore all your device events (like connections/disconnections, authentications, fota, jobs, etc.). 

You can easily debug your device behaviour by analyzing these events. For every event you can view and filter its timestamp, its type, the communication direction (Device-to-Cloud or Cloud-to-Device) and a payload with further information.


<figure>
  <a data-fancybox="gallery" href="../img/zcloudAct.png">
  <img src="../img/zcloudAct.png"/>
  </a>
</figure>



**Console** 

This section offers a real-time console that allows you to view all the data/conditions that are being sent by your device.

<figure>
  <a data-fancybox="gallery" href="../img/zcloudCons.png">
  <img src="../img/zcloudCons.png"/>
  </a>
</figure>

**File system**

The Zerynth File System is a shared drive between your device and Zerynth Cloud.

This section allows you to explore your device file system and upload new files or download the existing ones. It also allows you to syncronize the latest changes to your device and view the current syncronization status.

<figure>
  <a data-fancybox="gallery" href="../img/zcloudFS.png">
  <img src="../img/zcloudFS.png"/>
  </a>
</figure>


### Integrations

Integrations allow you to forward your devices data to external services. A common use case is using those data in third-party data visualization and business intelligence engines like Grafana or PowerBI.

Available integrations are Microsoft Azure, Ubidots, Davra and Webhooks.

<figure>
  <a data-fancybox="gallery" href="../img/zcloud4.png">
  <img src="../img/zcloud4.png"/>
  </a>
</figure>

### Firmwares

This section allows you to view and create new firmwares. You can also schedule a FOTA (Firmware-Over-The-Air) to single devices or fleets of devices.

<figure>
  <a data-fancybox="gallery" href="../img/zcloud5.png">
  <img src="../img/zcloud5.png"/>
  </a>
</figure>

### SIM Cards

This section allows you to keep track of all your SIM cards. By default it shows the SIM cards that are associated to the devices in the current workspace, but there is also the possibility to view all the SIM cards that you have claimed (even in other workspaces).

It offers an overview of the SIM cards, in which device they are being used and some information about the plan expiration and the data usage.

<figure>
  <a data-fancybox="gallery" href="../img/zcloudSim.png">
  <img src="../img/zcloudSim.png"/>
  </a>
</figure>

## Storage
### Data

This section is made to simplify how users interact with the data flowing to Zerynth Cloud.
It allows to easily navigate, filter, search and monitor data flowing to the whole workspace.

#### Features

- A dedicated GUI for monitoring, filtering and controlling the data flowing to the workspace
- Automatic recognition of incoming data
- Advanced REST API to get both raw and aggregated data (e.g., average value of a column)

<figure>
  <a data-fancybox="gallery" href="../img/zcloudStor.png">
  <img src="../img/zcloudStor.png"/>
  </a>
</figure>

### Exports

This section allows you to view and create new exports or periodic exports.

<figure>
  <a data-fancybox="gallery" href="../img/zcloudExp.png">
  <img src="../img/zcloudExp.png"/>
  </a>
</figure>

## Data analysis
### Zerynth Dashboard

It allows you to explore the dashboards you created in Zerynth Dashboard.

<figure>
  <a data-fancybox="gallery" href="../img/zcloudDash.png">
  <img src="../img/zcloudDash.png"/>
  </a>
</figure>

## Usage

It allows you to view the details of the usage of a single workspace in relation to the account plan. You can view your plan and the info about the devices, traffic, storage and dashboards consumed.

<figure>
  <a data-fancybox="gallery" href="../img/zcloud6.png">
  <img src="../img/zcloud6.png"/>
  </a>
</figure>



