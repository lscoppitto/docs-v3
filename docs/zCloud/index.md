# Zerynth Cloud

**Zerynth Cloud** is a complete platform that frees you from the burden of maintaining all the technology and infrastructure of developing and deploying fleets of devices, while focusing on the added value of IoT data.
From a single interface, provision and manage IoT devices, store and visualize data, and gain valuable insights and issue firmware updates on fleets of devices.


### **Zerynth Cloud** is composed of

* **Device Management**: anything from securely provisioning devices, updating and configuring them remotely is the task of the Zerynth Device Manager.
* **Data Storage**: IoT data needs to be stored, recovered and easily accessed for analysis and integration. The Zerynth Storage service has been developed with these goals in mind.
* **Dashboarding**: The Zerynth Dashboard service allows hosting and serving multiple customizable dashboards to visualize data and control device.

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
- A **Condition** is an event on steroids. Conditions can be opened, updated and closed by devices to notify specific status change (e.i. Battery status). Conditions can be monitored in real-time using the Zerynth Device Manager web interface or via API. 
- A **Job** is a command sent to a device. Jobs map to firmware functions like reset, diagnostics, control, update firmware, etc...


Zerynth Cloud can be easily accessed via at [https://zdm.zerynth.com](https://zdm.zerynth.com) or, for more advanced usages, via [command Line](../reference/cli/zdm/index.md) or [APIs](../reference/api/zdm/index.md).


### The On Premise way

If you don't want to be locked in by a third party cloud or you already have a containerized application, the easiest way to integrate with the Zerynth Device Manager is exposing an endpoint for data ingestion.

Just create a webhook integration from the Zerynth Device Manager web app and point it to the http address of your endpoint. The integration will keep sending data to your endpoint where a service running on your servers will receive them and be responsible for database insertion.

It seems a lot of work but we have you covered: from [here](https://github.com/zerynth/demo-template) you can checkout a demo repository with all the components already in place!



