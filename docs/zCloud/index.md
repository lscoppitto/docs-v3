# Zerynth Cloud

**Zerynth Cloud** is a complete platform that frees you from the burden of maintaining all the technology and infrastructure of developing and deploying fleets of devices, while focusing on the added value of IoT data.
From a single interface, manage IoT devices, store and visualize data, and gain insights.
Access from anywhere on the cloud, in a secure and easy way.



### **Zerynth Cloud** is composed of

* **Device Management**: Data and device management software to deploy scalable, and secure IoT solutions.
    * **Features**
        * Devices onboarding and provisioning with gold-standard security;
        * Devices lifecycle control with remote procedure call and over the air updates (FOTA) through REST APIs;
        * Data Management for storage, aggregation, and feeding of data to Zerynth’s Dashboard or any 3rd party application;
        * Event management with integrated alarm engine;
        * Easy integration with third-party services and frontends, including all of the major cloud service providers;
        * Fully integrated cellular connectivity with SIM/eSIM and private secure connection;
        * Available as a service or on-premises.

* **Data Storage**: A dedicated cloud service optimized for storing time series data. It enables retrieving the raw or aggregated data through APIs and exporting it into other formats (csv, json).
    * **Features**
        * A dedicated GUI for monitoring, filtering and controlling the data flowing to the workspace
        * Advanced REST API to get both raw and aggregated data (e.g. average value of a column)
        * Single or periodic exports of data of single or fleet or multiple fleets of devices in CSV or JSON formats

* **Dashboarding**: A powerful data visualization and business intelligence engine that enable designing and building interactive and user friendly dashboards.
    * **Features**
        * Easy-to-use templates for Zero Code dashboard building
        * Alerts based on thresholds with notifications on Slack, Telegram, GChat, Discord and Email
        * Permission system with editor/viewer user roles
        * Highly customizable via SQL query language

[**Rest open APIs** are also available.](../reference/api/zdm/) They enable users to access devices, job and FOTA services, as well as workspaces and fleets operations. They can be called from any application that can send an HTTPS request and receive an HTTPS response.

### Features

- **Provisioning**: associate device certificates securely stored in a crypto element with your cloud account in just a click. No more cumbersome and insecure credentials generation that hinders security and slows down mass deployments.
- **Connectivity**: transfer data to the cloud with state of the art two-way authenticated and encrypted TLS connections.
- **Life Cycle Management**: perform complex orchestration tasks by sending jobs and over-the-air updates to your fleets; from an easy to use GUI or programmatically via CLI or REST APIs.
- **Data Availability**: avoid losing precious data by temporarily queueing them on the Zerynth Device Manager when your data sinks are down.
- **Integrations**:  forward data via convenient webhooks or API to your final IoT application or to the integrated dashboard services.

Zerynth cloud can be adapted to all kinds of deployments, being available as a SaaS hosted by us or as an on-premises containerized application.


**We built Zerynth cloud based on the following key concepts:**

- A **Device** is the cloud representation of the physical IoT device. A Zerynth Device Manager device is associated to a physical device during provisioning. An action performed over a Zerynth Device Manager device (i.e. sending an update or a new configuration) is always reflected and communicated to the physical device.
- A **Workspace** is an entity that groups together all the devices belonging to a single project. Zerynth Device Manager accounts can have multiple independent workspaces, one for each project.
- A **Fleet** is a group of devices belonging to a Workspace. You can use fleets to group devices with similar features and applications. Fleets allow sending bulk device commands, OTA updates and jobs.
- An **Integration** is an interface between the zerynth cloud and other 3rd party services.

Devices send data, events and receive requests from the Zerynth Device Manager. In particular:

- A **Tag** is a data label used for querying data. Each device can publish its data under multiple Tags and the Zerynth Device Manager will take care of dispatching them to integrations accordingly.
- A **Job** is a command sent to a device. Jobs map to firmware functions like reset, diagnostics, control, update firmware, etc...


Zerynth Cloud can be easily accessed via at [https://zdm.zerynth.com](https://zdm.zerynth.com) or, for more advanced usages, via [command Line](../reference/cli/zdm/index.md) or [APIs](../reference/api/zdm/index.md).


### The On Premise way

If you don't want to be locked in by a third party cloud or you already have a containerized application, the easiest way to integrate with the Zerynth Device Manager is exposing an endpoint for data ingestion.

Just create a webhook integration from the Zerynth Device Manager web app and point it to the http address of your endpoint. The integration will keep sending data to your endpoint where a service running on your servers will receive them and be responsible for database insertion.

It seems a lot of work but we have you covered: from [here](https://github.com/zerynth/demo-template) you can checkout a demo repository with all the components already in place!



