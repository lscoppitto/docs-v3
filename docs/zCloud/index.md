# Introduction to Zerynth Cloud

The Internet of Things is all about extracting valuable data from billions of connected devices. However, Developing IoT enabled device is very difficult as you need to develop and deploy hundreds of devices while keeping security, connectivity and scalablity in mind.

**Zerynth Cloud** is a complete platform that frees you from the burden of maintaining all the technology and infrastructure of developing and deploying fleets of devices, while focusing on the added value of IoT data.
From a single interface, provision and manage IoT devices, store and visualize data, and gain valuable insights and issue firmware updates on fleets of devices.


## **Zerynth Cloud** is composed of

* **Device Management**: anything from securely provisioning devices, updating and configuring them remotely is the task of the [Zerynth Device Manager](zdm_intro.md) and its [Over the Air Update](FOTA.md) capabilities.
* **Data Storage**: IoT data needs to be stored, recovered from accidental corruption and easily accessed for analysis and integration. The [Zerynth Storage](zdm_intro.md) service has been developed with these goals in mind.
* **Dashboarding**: no better tool than a properly designed dashboard can help extract useful insights from IoT data. The Zerynth Dashboard service allows hosting and serving multiple customizable dashboards getting data directly from the Zerynth Storage.

<figure>
  <a data-fancybox="gallery" href="img/zCloud.png">
  <img src="img/zCloud.png"/>
  </a>
</figure>


## Zerynth Cloud Inteface

### Workspaces Navigation Page

A **Workspace** is a group of devices, single fleet or multiple fleets of devices. You can imagine the workspace as the main folder of your project or your product.
The workspace menu is contextual and remembers the latest section you visited. Workspaces are also searchable for easy navigation across many projects.


<figure>
  <a data-fancybox="gallery" href="img/zcloud1.jpg">
  <img src="img/zcloud1.jpg"/>
  </a>
</figure>

### Devices Overview Page

This page serves as main overview of the fleets or devices inside the workspace. It provides information such as device name, device ID and connection status of each device and the provisioning status of each device.
Users can view single or multiple fleets and can search across devices and fleets with name or ID.



<figure>
  <a data-fancybox="gallery" href="img/zcloud2.jpg">
  <img src="img/zcloud2.jpg"/>
  </a>
</figure>


### Device Page

This page serves as the main control panel for the device. It consists of an overview section with relevant information on the device operation as well as Jobs&Fota section for issuing RPCs and Activity and console pages for monitoring data and operations.

**Overview:** it contains the main device's information such as 

* Device connection status, last disconnection and communication statistics.
* Graph of recent data activity
* Status of the latest FOTA and Job issued.
* Cellular data Activity



<figure>
  <a data-fancybox="gallery" href="img/zcloud3.jpg">
  <img src="img/zcloud3.jpg"/>
  </a>
</figure>

**Jobs & FOTA:** 

The page shows Jobs and Fota operations information, Latest calls and the status of each call.

FOTAs can be currently scheduled on single devices or multiple fleets or - if the filters are not set - the entire workspace

<figure>
  <a data-fancybox="gallery" href="img/zcloudFota.jpg">
  <img src="img/zcloudFota.jpg"/>
  </a>
</figure>

**Activity:** 

it is a new section that allows you to explore all your device events (like connections/disconnections, authentications, fota, jobs, etc.). 

You can easily debug your device behaviour by analyzing these events. For every event you can view and filter its timestamp, its type, the communication direction (Device-to-Cloud or Cloud-to-Device) and a payload with further information.


<figure>
  <a data-fancybox="gallery" href="img/zcloudAct.jpg">
  <img src="img/zcloudAct.jpg"/>
  </a>
</figure>



**Console:** 
It is a real time console that allows you to view all the data/conditions that are being sent by your device




### Integration Page

Integrate the data with third-party data visualization and business intelligence engines like Grafana or PowerBI.
Available integrations are Microsoft Azure, Ubidots, Davra and Webhooks. Users can also filter integrations, Enable or delete them.

<figure>
  <a data-fancybox="gallery" href="img/zcloud4.jpg">
  <img src="img/zcloud4.jpg"/>
  </a>
</figure>

### Firmware Page

The section allows users to configure firmware for single device or fleet of devices.
<figure>
  <a data-fancybox="gallery" href="img/zcloud5.jpg">
  <img src="img/zcloud5.jpg"/>
  </a>
</figure>

### Storage Section

This section is made to simplify how users interact with the data flowing to Zerynth Cloud.
It allows to easily navigate, filter, search and monitor data flowing to the whole workspace.


<figure>
  <a data-fancybox="gallery" href="img/zcloudStor.jpg">
  <img src="img/zcloudStor.jpg"/>
  </a>
</figure>

### Usage Section

It allows you to view the details of the usage of a single workspace in relation to the account plan. You can view your plan and the info about the devices, traffic and storage consumed.

<figure>
  <a data-fancybox="gallery" href="img/zcloud6.jpg">
  <img src="img/zcloud6.jpg"/>
  </a>
</figure>



