# **Track KPIs and Create Interactive Dashboards in Zerynth Cloud**
Dashboard is the interface the user uses to interact with the IoT solution. It enables clear visualization of key KPIs on the solution and enables control over fleets of devices.
Zerynth makes it easy to control devices, monitor industrial sensors and machines, and generate reports through our integrated dashboard service.
In this tutorial, We will create our first dashboard in Zerynth Cloud, We will create a basic template with 1 panel to visualize data, Feel free to customize the template according to your application.

### **Activate Zerynth Dashboard**

The first step is to enable the Zerynth Dashboard service in your workspace, Inside your workspace, click on “Zerynth Dashboard” section in the left bar.

<figure>
  <a data-fancybox="gallery" href="../img/dashboard1.png">
  <img src="../img/dashboard1.png" />
  </a>
</figure>

Enable the dashboard service by clicking “Enable Zerynth Dashboard” button.

<figure>
  <a data-fancybox="gallery" href="../img/dashboard2.png">
  <img src="../img/dashboard2.png" />
  </a>
</figure>

### **Create a new Layout**

Inside the dashboard section, Click on “+” and then on “Dashboard”.

Create a new panel by clicking on “Add an empty panel".

<figure>
  <a data-fancybox="gallery" href="../img/dashboard3.png">
  <img src="../img/dashboard3.png" />
  </a>
</figure>

On the right, there are some settings about the panel such as panel name, panel type, and other settings that depend on the active panel.
On the left side, you can make a query to get data to visualize.
You can write a query using “Query builder” or write an SQL raw query.
Initially, you are in “Query builder” mode, but by clicking on “Edit SQL” you switch to raw query mode.

<figure>
  <a data-fancybox="gallery" href="../img/dashboard4.png">
  <img src="../img/dashboard4.png" />
  </a>
</figure>

Here's an example of an SQL raw query with the “Time series” panel type.
```SQL
SELECT 
  ts_device as time,
  (payload->>'temp')::float as temp
FROM data
ORDER BY ts_device
```

<figure>
  <a data-fancybox="gallery" href="../img/dashboard5.png">
  <img src="../img/dashboard5.png" />
  </a>
</figure>


Click on the “Save” button on the top right to save the dashboard.

### **SQL Query**

through SQL queries you can get data or conditions.

#### **Data queries**

To get data, you need to put “data” after “FROM”, and you can use the following columns.

| Name          | Type   | Description                                                        |
| ------------- | ------ | ------------------------------------------------------------------ |
| ts\_device    | time   | Timestamp corresponding to when the data has been sent by device   |
| ts\_zdm       | time   | Timestamp corresponding to when the data has arrived on ZDM        |
| ts\_db        | time   | Timestamp corresponding to when the data has been save on database |
| workspace\_id | string | Workspace id of the device                                         |
| fleet\_id     | string | Fleet id of the device                                             |
| device\_id    | string | Id of the device                                                   |
| tag           | string | Publication tag with whom the data has been sent by device         |
| payload       | jsonb  | Payload published by device                                        |

#### **Condition queries**

To get conditions, you need to put “conditions” after “FROM”, and you can use the following columns.

| Name          | Type   | Description                                                    |
| ------------- | ------ | -------------------------------------------------------------- |
| Id            | string | Id of the condition                                            |
| tag           | string | Publication tag with whom the data has been sent by device     |
| workspace\_id | string | Workspace id of the device                                     |
| fleet\_id     | string | Fleet id of the device                                         |
| device\_id    | string | Id of the device                                               |
| payload       | jsonb  | Payload published by device when the condition has been opened |
| payloadf      | jsonb  | Payload published by device when the condition has been closed |
| start         | time   | Timestamp that indicates when the condition has been opened    |
| finish        | time   | Timestamp that indicates when the condition has been closed    |



### **More information**

In simple steps, we have created our template in Zerynth dashboard.
If you have any questions, Please drop us a message on our [Helpdesk](https://www.zerynth.com/helpdesk/).