# Zerynth Apps API

All the following requests must be authenticated with a valid API key. For more information about how to get an API key, see [Authentication](#authentication).
The base URL for all requests is `https://api.cloud.zerynth.com/v3`.

## Machines APP

### List machines

List all machines in the current workspace.

`GET /dashboards/{workspace_id}/machines`

#### Response

- **assets** (object[]) - Array of machine objects. The machine object has the following fields:
    - **id** (string) - Machine ID
    - **name** (string) - Machine name
    - **workspace_id** (string) - The ID of the workspace that contains the machine
    - **asset_type** (string) - The type of the machine (service, production, cabinet)
    - **status** (string) - The status of the machine (idle, working)
    - **alarm** (boolean) - The alarm status of the machine (true, false)
    - **devices** (object[]) - Array of devices that are associated to the machine. The device object has the following fields:
        - **id** (string) - Device ID
        - **name** (string) - Device name
        - **account_id** (string) - The ID of the account
        - **config** (object) - The configuration of the device
        - **created_at** (date) - Machine creation date in RFC3339 format
    - **created_at** (date) - Machine creation date in RFC3339 format

#### Example

`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/machines`

`200 OK`

```json
{
  "assets": [
    {
      "id": "ast-123456",
      "name": "Machine1",
      "workspace_id": "wks-123456789",
      "asset_type": "service_machine",
      "status": "idle",
      "alarm": false,
      "devices": [
        {
          "id": "dev-abcdefghij",
          "name": "Machine1",
          "account_id": "",
          "config": {
            "mode": "basic",
            "output_lines": 1,
            "max_value_input": 8,
            "network_voltage": 230,
            "max_value_output": 2.5,
            "rate_clamp_input": 200,
            "rate_clamp_output": 200,
            "output_lines_names": [
              "Line 1"
            ],
            "max_value_alert_input": 2
          },
          "created_at": "2023-09-05T13:17:53.928183Z",
          "deleted_at": "0001-01-01T00:00:00Z"
        }
      ],
      "created_at": "2023-09-05T13:17:53.928181Z"
    }
  ]
}
```

## Consumption APP
### Consumption Overview (Service and Production machines)
`GET /dashboards/{workspace_id}/consumption/machines`

#### Query Parameters
- **from** (date) - Start date in RFC3339 format
- **to** (date) - End date in RFC3339 format

#### Response
- **consumption** (object) The consumption object in the response. The consumption object has the following fields:
  - **power** (number) - The current power of all the machines in the current workspace (in kW)
  - **consumption** (number) - The consumption of all the machines in the specified time range (in kWh)
  - **d_consumption** (number) - The delta consumption of the machines between the specified time range and the previous one (in percentage)
  - **h_consumption** (object[]) - Array of consumption detail objects. The consumption object has the following fields:
    - **ts** (date) - The timestamp of the consumption value in RFC3339 format
    - **value** (number) - The power value (in kW)
  - **cost** (number) - The cost of the consumption based on the currency set in the settings of the workspace
  - **d_cost** (number) - The delta cost between the current time range and the previous one (in percentage)
  - **h_cost** (object[]) - Array of cost objects. The cost object has the following fields:
    - **ts** (date) - The timestamp of the cost recording in RFC3339 format
    - **value** (number) - The cost
  - **type_contributions** (object[]) - The type contribution object has the following fields:
    - **key** (string) - Machine type
    - **value** (number) - Cost contribution of the machine type
  - **assets** (object[]) - Array of machine objects. The machine object has the following fields:
    - **id** (string) - The ID of the asset
    - **name** (string) - The name of the asset
    - **asset_type** (string) - The type of the asset (service_machine, production_machine, cabinet)
    - **status** (string) - The status of the asset (idle, working)
    - **alarm** (boolean) - The alarm status of the asset (true, false)
    - **power** (number) - The current power of the asset (in kW)
    - **consumption** (number) - The consumption of the asset in the specified time range (in kWh)
    - **cost** (number) - The cost of the consumption of the asset in the specified time range
    - **d_cost** (number) - The delta cost of the asset between the specified time range and the previous one (in percentage)

#### Example

`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/consumption/machines`

`200 OK`
```json

{
  "consumption": {
    "power": 6.78,
    "consumption": 5.66,
    "d_consumption": 0.4,
    "h_consumption": [
      {
        "ts": "2023-09-27T11:00:00+00:00",
        "value": 76.32
      },
      {
        "ts": "2023-09-27T12:00:00+00:00",
        "value": 263.16
      }
    ],
    "cost": 2.77,
    "d_cost": 0.4,
    "h_cost": [
      {
        "ts": "2023-09-27T11:00:00+00:00",
        "value": 37.3968
      },
      {
        "ts": "2023-09-27T12:00:00+00:00",
        "value": 128.9484
      }
    ],
    "type_contributions": [
      {
        "key": "production_machines",
        "value": 4.35
      },
      {
        "key": "service_machines",
        "value": 1.3
      }
    ],
    "assets": [
      {
        "id": "ast-1234567",
        "name": "Injection Molding Press 2",
        "asset_type": "production_machine",
        "status": "working",
        "alarm": true,
        "power": 2.41,
        "consumption": 2.19,
        "cost": 1.07,
        "d_cost": 0
      },
      {
        "id": "ast-1234568",
        "name": "Injection Molding Press 1",
        "asset_type": "production_machine",
        "status": "working",
        "alarm": false,
        "power": 2.36,
        "consumption": 2.17,
        "cost": 1.06,
        "d_cost": 0
      },
      {
        "id": "ast-1234569",
        "name": "Ventilation System",
        "asset_type": "service_machine",
        "status": "working",
        "alarm": false,
        "power": 2.01,
        "consumption": 1.3,
        "cost": 0.64,
        "d_cost": 0
      }
    ]
  }
}
```

### Consumption Details (Service and Production machines)
`GET /dashboards/{workspace_id}/consumption/machines/{machine_id}`

#### Query Parameters
- **from** (date) - Start date in RFC3339 format
- **to** (date) - End date in RFC3339 format

#### Response
- **consumption** (object) The consumption object in the response. The consumption object has the following fields:
  - **id** (string) - The ID of the asset
  - **name** (string) - The name of the asset
  - **asset_type** (string) - The type of the asset (service_machine, production_machine, cabinet)
  - **status** (string) - The status of the asset (idle, working)
  - **alarm** (boolean) - The alarm status of the asset (true, false)
  - **power** (number) - The current power of the asset (in kW)
  - **consumption** (number) - The consumption of the asset in the specified time range (in kWh)
  - **d_consumption** (number) - The delta consumption of the asset between the specified time range and the previous one (in percentage)
  - **h_consumption** (object[]) - Array of consumption detail objects. The consumption object has the following fields:
    - **ts** (date) - The timestamp of the consumption value in RFC3339 format
    - **value** (number) - The power value (in kW)
  - **cost** (number) - The cost of the consumption of the asset in the specified time range
  - **d_cost** (number) - The delta cost of the asset between the specified time range and the previous one (in percentage)
  - **h_status** (object[]) - Array of status objects. The status object has the following fields:
    - **start** (date) - The start timestamp of the status in RFC3339 format
    - **end** (date) - The end timestamp of the status in RFC3339 format
    - **state** (string) - The status of the asset (idle, working)
  - **h_alarm** (object[]) - Array of alarm objects. The alarm object has the following fields:
    - **start** (date) - The start timestamp of the alarm in RFC3339 format
    - **end** (date) - The end timestamp of the alarm in RFC3339 format
    - **alarm** (string) - The alarm status of the asset (0, 1)
  - **state_contributions** (object[]) - The state contribution object has the following fields:
    - **key** (string) - Machine state
    - **value** (number) - Consumption contribution of the machine state

`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/consumption/machines/ast-1234567`

`200 OK`

```json
{
  "consumption": {
    "id": "ast-234567",
    "name": "Injection Molding Press 2",
    "asset_type": "production_machine",
    "status": "working",
    "alarm": true,
    "power": 2.42,
    "consumption": 2.37,
    "d_consumption": 0.1,
    "h_consumption": [
      {
        "ts": "2023-09-27T14:02:45+00:00",
        "value": 2.37
      },
      {
        "ts": "2023-09-27T14:03:45+00:00",
        "value": 2.43
      },
      {
        "ts": "2023-09-27T14:04:45+00:00",
        "value": 2.33
      },
      {
        "ts": "2023-09-27T14:05:46+00:00",
        "value": 2.44
      },
      {
        "ts": "2023-09-27T14:06:46+00:00",
        "value": 2.34
      }
    ],
    "cost": 1.16,
    "d_cost": 0.1,
    "h_status": [
      {
        "start": "2023-09-27T13:54:42Z",
        "end": null,
        "state": "working"
      }
    ],
    "h_alarm": [
      {
        "start": "2023-09-27T14:05:46Z",
        "end": "2023-09-27T14:06:46Z",
        "alarm": "1"
      }
    ],
    "state_contributions": [
      {
        "key": "idle",
        "value": 0
      },
      {
        "key": "working",
        "value": 2.37
      }
    ]
  }
}
```
