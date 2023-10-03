# Zerynth Apps API

All the following requests must be authenticated with a valid API key. For more information about how to get an API key, see [Authentication](../authentication/index.md).
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

#### Example
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

### Consumption Details (Electrical panels)
`GET /dashboards/{workspace_id}/consumption/cabinets/{machine_id}`

#### Query Parameters
- **from** (date) - Start date in RFC3339 format
- **to** (date) - End date in RFC3339 format

#### Response
- **consumption** (object) The consumption object in the response. The consumption object has the following fields:
  - **id** (string) - The ID of the asset
  - **name** (string) - The name of the asset
  - **asset_type** (string) - The type of the asset (cabinet)
  - **status** (string) - The status of the asset (disconnected, working)
  - **h_status** (object[]) - Array of status objects. The status object has the following fields:
    - **start** (date) - The start timestamp of the status in RFC3339 format
    - **end** (date) - The end timestamp of the status in RFC3339 format
    - **state** (string) - The status of the asset (disconnected, working)
  - **power** (number) - The current power of the asset (in kW)
  - **h_power** (object[]) - Array of power detail objects. The power object has the following fields:
    - **ts** (date) - The timestamp of the power value in RFC3339 format
    - **value** (number) - The power value (in kW)
  - **consumption** (number) - The consumption of the asset in the specified time range (in kWh)
  - **h_consumption** (object[]) - Array of consumption detail objects. The consumption object has the following fields:
    - **ts** (date) - The timestamp of the consumption value in RFC3339 format
    - **value** (number) - The consumption value (in kWh)
  - **phase_unbalance** (number) - The phase unbalance of the asset
  - **consumption_contributions** (object[]) - The consumption contribution object has the following fields:
    - **key** (string) - Line number
    - **value** (number) - Consumption contribution of the line
  - **lines** (object[]) - Array of output line objects. The output line object has the following fields:
    - **line** (string) - Line number
    - **consumption** (number) - Consumption of the line (in kWh)
    - **status** (string) - The status of the line (disconnected, working)
    - **alarm** (boolean) - The alarm status of the line (true, false)
  - **lines_in** (object[]) - Array of input line objects. The input line object has the following fields:
    - **line** (string) - Line number
    - **status** (string) - The status of the line (disconnected, working)
  - **power_analyzer_values** (object) - The power analyzer values object has the following fields:
    - **current_in** (number[][]) - Array of input current values. This array contains 3 arrays, one for each input line. For every line, the array contains 3 values: average, maximum, minimum (in A).
    - **voltage_in** (number[][]) - Array of input voltage values. This array contains 3 arrays, one for each input line. For every line, the array contains 3 values: average, maximum, minimum (in V).
    - **total_harmonic_distortion** (number[][]) - Array of total harmonic distortion values. This array contains 3 arrays, one for each input line. For every line, the array contains 3 values: average, maximum, minimum (in %).
    - **reactive_power** (number[]) - Array of reactive power values. This array contains 3 values, one for each input line (in VAr).
    - **apparent_power** (number[]) - Array of apparent power values. This array contains 3 values, one for each input line (in VA).
    - **power_factor** (number[]) - Array of power factor values. This array contains 3 values, one for each input line (in kW).
    - **current_unbalance** (number[][]) - Array of current unbalance values. This array contains 3 arrays, one for each input line. For every line, the array contains 3 values: average, maximum, minimum (in %).
    - **voltage_unbalance** (number[][]) - Array of voltage unbalance values. This array contains 3 arrays, one for each input line. For every line, the array contains 3 values: average, maximum, minimum (in %).

#### Example
`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/consumption/cabinets/ast-123456789`

`200 OK`

```json
{
  "consumption": {
    "id": "ast-123456789",
    "name": "Production Area 1",
    "asset_type": "cabinet",
    "status": "working",
    "h_status": [
      {
        "start": "2023-09-28T06:29:22Z",
        "end": null,
        "state": "working"
      }
    ],
    "power": 8.31,
    "h_power": [
      {
        "ts": "2023-09-28T07:45:17+00:00",
        "value": 7.62
      },
      {
        "ts": "2023-09-28T07:46:18+00:00",
        "value": 8.5
      },
      {
        "ts": "2023-09-28T07:47:18+00:00",
        "value": 8.53
      },
      {
        "ts": "2023-09-28T07:48:19+00:00",
        "value": 9.68
      },
      {
        "ts": "2023-09-28T07:49:20+00:00",
        "value": 8.31
      }
    ],
    "consumption": 0.71,
    "h_consumption": [
      {
        "ts": "2023-09-28T07:45:17+00:00",
        "value": 7.62
      },
      {
        "ts": "2023-09-28T07:46:18+00:00",
        "value": 8.5
      },
      {
        "ts": "2023-09-28T07:47:18+00:00",
        "value": 8.53
      },
      {
        "ts": "2023-09-28T07:48:19+00:00",
        "value": 9.68
      },
      {
        "ts": "2023-09-28T07:49:20+00:00",
        "value": 8.31
      }
    ],
    "phase_unbalance": 0.24,
    "consumption_contributions": [
      {
        "key": "1",
        "value": 0.05
      },
      {
        "key": "2",
        "value": 0
      },
      {
        "key": "3",
        "value": 0.09
      },
      {
        "key": "4",
        "value": 0
      },
      {
        "key": "5",
        "value": 0.57
      }
    ],
    "lines": [
      {
        "line": "1",
        "consumption": 0.05,
        "status": "working",
        "alarm": true
      },
      {
        "line": "2",
        "status": "disconnected"
      },
      {
        "line": "3",
        "consumption": 0.09,
        "status": "working",
        "alarm": true
      },
      {
        "line": "4",
        "status": "disconnected"
      },
      {
        "line": "5",
        "consumption": 0.57,
        "status": "working",
        "alarm": true
      }
    ],
    "lines_in": [
      {
        "line": "1",
        "status": "working"
      },
      {
        "line": "2",
        "status": "working"
      },
      {
        "line": "3",
        "status": "working"
      }
    ],
    "power_analyzer_values": {
      "current_in": [
        [
          1.12,
          1.15198,
          1.06078
        ],
        [
          2.126,
          2.32592,
          2.07272
        ],
        [
          2.851,
          2.9303,
          2.813
        ]
      ],
      "voltage_in": [
        [
          393.835,
          394.072,
          393.508
        ],
        [
          392.817,
          393.127,
          392.506
        ],
        [
          392.836,
          393.03,
          392.509
        ]
      ],
      "total_harmonic_distortion": [
        [
          22.529,
          24.7641,
          18.5604
        ],
        [
          60.827,
          64.3095,
          59.8084
        ],
        [
          35.223,
          36.896,
          33.8403
        ]
      ],
      "reactive_power": [
        0,
        -350.731,
        -380.632
      ],
      "apparent_power": [
        721.169,
        732.426,
        706.47
      ],
      "power_factor": [
        1.14,
        1.15137,
        1.12361
      ],
      "current_unbalance": [
        [
          44.807,
          46.9071,
          43.2184
        ],
        [
          4.482,
          7.85277,
          2.53483
        ],
        [
          40.325,
          43.9008,
          37.5784
        ]
      ]
    }
  }
}
```

### Consumption Details (Electrical panel line)
`GET /dashboards/{workspace_id}/consumption/cabinets/{machine_id}/{line_id}`

#### Query Parameters
- **from** (date) - Start date in RFC3339 format
- **to** (date) - End date in RFC3339 format

#### Response
- **consumption** (object) The consumption object in the response. The consumption object has the following fields:
  - **id** (string) - The ID of the asset
  - **name** (string) - The name of the asset
  - **line** (string) - Line number
  - **asset_type** (string) - The type of the asset (cabinet)
  - **status** (string) - The status of the electrical panel line (disconnected, working)
  - **h_status** (object[]) - Array of status objects. The status object has the following fields:
    - **start** (date) - The start timestamp of the status in RFC3339 format
    - **end** (date) - The end timestamp of the status in RFC3339 format
    - **state** (string) - The status of the line (disconnected, low, medium, high, critical)
  - **alarm** (boolean) - The alarm status of the line (true, false)
  - **h_alarm** (object[]) - Array of alarm objects. The alarm object has the following fields:
    - **start** (date) - The start timestamp of the alarm in RFC3339 format
    - **end** (date) - The end timestamp of the alarm in RFC3339 format
    - **alarm** (string) - The alarm status of the line (0, 1)
  - **power** (number) - The current power of the line (in kW)
  - **h_power** (object[]) - Array of power detail objects. The power object has the following fields:
    - **ts** (date) - The timestamp of the power value in RFC3339 format
    - **value** (number) - The power value (in kW)
  - **consumption** (number) - The consumption of the line in the specified time range (in kWh)
  - **h_consumption** (object[]) - Array of consumption detail objects. The consumption object has the following fields:
    - **ts** (date) - The timestamp of the consumption value in RFC3339 format
    - **value** (number) - The consumption value (in kWh)
  - **state_contributions** (object[]) - Array of state contribution objects. The state contribution object has the following fields:
    - **key** (string) - Machine state (disconnected, low, medium, high, critical)
    - **value** (number) - Consumption contribution of the machine state

#### Example
`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/consumption/cabinets/ast-123456789/1`

`200 OK`

```json
{
  "consumption": {
    "id": "ast-123456789",
    "name": "Production Area 1",
    "line": "1",
    "asset_type": "cabinet",
    "status": "working",
    "h_status": [
      {
        "start": "2023-09-28T07:41:14Z",
        "end": "2023-09-28T07:50:21Z",
        "state": "critical"
      },
      {
        "start": "2023-09-28T07:50:21Z",
        "end": null,
        "state": "critical"
      }
    ],
    "alarm": true,
    "h_alarm": [
      {
        "start": "2023-09-28T07:41:14Z",
        "end": "2023-09-28T07:50:21Z",
        "alarm": "1"
      },
      {
        "start": "2023-09-28T07:50:21Z",
        "end": null,
        "alarm": "1"
      }
    ],
    "power": 0.54,
    "h_power": [
      {
        "ts": "2023-09-28T07:46:18+00:00",
        "value": 0.54
      },
      {
        "ts": "2023-09-28T07:47:18+00:00",
        "value": 0.55
      },
      {
        "ts": "2023-09-28T07:48:19+00:00",
        "value": 0.54
      },
      {
        "ts": "2023-09-28T07:49:20+00:00",
        "value": 0.54
      },
      {
        "ts": "2023-09-28T07:50:21+00:00",
        "value": 0.54
      }
    ],
    "consumption": 0.05,
    "h_consumption": [
      {
        "ts": "2023-09-28T07:46:18+00:00",
        "value": 0.54
      },
      {
        "ts": "2023-09-28T07:47:18+00:00",
        "value": 0.55
      },
      {
        "ts": "2023-09-28T07:48:19+00:00",
        "value": 0.54
      },
      {
        "ts": "2023-09-28T07:49:20+00:00",
        "value": 0.54
      },
      {
        "ts": "2023-09-28T07:50:21+00:00",
        "value": 0.54
      }
    ],
    "state_contributions": [
      {
        "key": "high",
        "value": 0
      },
      {
        "key": "low",
        "value": 0
      },
      {
        "key": "medium",
        "value": 0
      },
      {
        "key": "disconnected",
        "value": 0
      },
      {
        "key": "critical",
        "value": 0.71
      }
    ]
  }
}
```
## Productivity APP
### Productivity Overview (Production machines)
`GET /dashboards/{workspace_id}/productivity`

#### Query Parameters
- **from** (date) - Start date in RFC3339 format
- **to** (date) - End date in RFC3339 format

#### Response
- **productivity** (object) The productivity object in the response. The productivity object has the following fields:
  - **assets** (object[]) Array of machine objects. The machine object has the following fields:
    - **id** (string) - The ID of the asset
    - **name** (string) - The name of the asset
    - **asset_type** (string) - The type of the asset (production_machine)
    - **status** (string) - The status of the asset (idle, working)
    - **alarm_time** (number) - The alarm time of the asset (in seconds)
    - **avg_cycle_time** (number) - The average cycle time of the asset (in seconds)
    - **total_items** (number) - The total items produced by the asset
    - **good_items** (number) - The good items produced by the asset
    - **bad_items** (number) - The bad items produced by the asset
    - **consumption** (number) - The consumption of the asset in the specified time range (in kWh)
    - **cost** (number) - The cost of the consumption of the asset in the specified time range
    - **availability** (number) - The availability of the asset (proportion from 0 to 1)
    - **performance** (number) - The performance of the asset (proportion from 0 to 1)
    - **quality** (number) - The quality of the production processes (proportion from 0 to 1)
    - **oee** (number) - The OEE of the asset, which is the product of the three factors above (proportion from 0 to 1)
    - **oee_timeline** (object[]) - Array of OEE detail objects. The OEE detail object has the following fields:
      - **value** (number) - The OEE value (proportion from 0 to 1)
      - **start** (date) - The start timestamp of the OEE value in RFC3339 format
      - **end** (date) - The end timestamp of the OEE value in RFC3339 format    
  - **h_oee** (object[]) - Array of OEE detail objects. The OEE detail object has the following fields:
    - **ts** (date) - The timestamp of the OEE value in UNIX format
    - **value** (number) - The OEE value (proportion from 0 to 1)
  - **h_pieces** (object[]) - Array of pieces detail objects. The pieces detail object has the following fields:
    - **ts** (date) - The timestamp of the pieces value in UNIX format
    - **value** (object) - The pieces value object has the following fields:
      - **good** (number) - The good pieces value
      - **bad** (number) - The bad pieces value

#### Example
`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/productivity` 

`200 OK`

```json
{
  "productivity": {
    "assets": [
      {
        "id": "ast-1234568",
        "name": "Injection Molding Press 1",
        "asset_type": "production_machine",
        "status": "idle",
        "alarm_time": 0,
        "avg_cycle_time": 9.8,
        "total_items": 1,
        "good_items": 1,
        "bad_items": 0,
        "consumption": 186.2814,
        "cost": 0,
        "availability": 0.2,
        "performance": 0,
        "quality": 1,
        "oee": 0,
        "oee_timeline": [
          {
            "value": 0,
            "start": "2023-09-28T07:47:00Z",
            "end": "2023-09-28T07:48:00Z"
          },
          {
            "value": 0,
            "start": "2023-09-28T07:48:00Z",
            "end": "2023-09-28T07:49:00Z"
          },
          {
            "value": 0,
            "start": "2023-09-28T07:49:00Z",
            "end": "2023-09-28T07:50:00Z"
          },
          {
            "value": 0,
            "start": "2023-09-28T07:50:00Z",
            "end": null
          },
          {
            "value": 0,
            "start": "2023-09-28T07:46:00Z",
            "end": "2023-09-28T07:47:00Z"
          }
        ]
      },
      {
        "id": "ast-1234567",
        "name": "Injection Molding Press 2",
        "asset_type": "production_machine",
        "status": "idle",
        "alarm_time": 0,
        "avg_cycle_time": 0,
        "total_items": 0,
        "good_items": 0,
        "bad_items": 0,
        "consumption": 168.7815,
        "cost": 0,
        "availability": 0,
        "performance": 0,
        "quality": 0,
        "oee": 0,
        "oee_timeline": [
          {
            "value": 0,
            "start": "2023-09-28T07:50:00Z",
            "end": null
          },
          {
            "value": 0,
            "start": "2023-09-28T07:46:00Z",
            "end": "2023-09-28T07:47:00Z"
          },
          {
            "value": 0,
            "start": "2023-09-28T07:47:00Z",
            "end": "2023-09-28T07:48:00Z"
          },
          {
            "value": 0,
            "start": "2023-09-28T07:48:00Z",
            "end": "2023-09-28T07:49:00Z"
          },
          {
            "value": 0,
            "start": "2023-09-28T07:49:00Z",
            "end": "2023-09-28T07:50:00Z"
          }
        ]
      }
    ],
    "h_oee": [
      {
        "ts": 1695887160,
        "value": 0
      },
      {
        "ts": 1695887220,
        "value": 0
      },
      {
        "ts": 1695887280,
        "value": 0
      },
      {
        "ts": 1695887340,
        "value": 0
      },
      {
        "ts": 1695887400,
        "value": 0
      }
    ],
    "h_pieces": [
      {
        "ts": 1695887160,
        "value": {
          "good": 1,
          "bad": 0
        }
      },
      {
        "ts": 1695887220,
        "value": {
          "good": 0,
          "bad": 0
        }
      },
      {
        "ts": 1695887280,
        "value": {
          "good": 0,
          "bad": 0
        }
      },
      {
        "ts": 1695887340,
        "value": {
          "good": 0,
          "bad": 0
        }
      },
      {
        "ts": 1695887400,
        "value": {
          "good": 0,
          "bad": 0
        }
      }
    ]
  }
}
```

### Productivity Single Machine Details
`GET /dashboards/{workspace_id}/productivity/{machine_id}`

#### Query Parameters
- **from** (date) - Start date in RFC3339 format
- **to** (date) - End date in RFC3339 format

#### Response
- **productivity** (object) The productivity object in the response. The productivity object has the following fields:
  - **id** (string) - The ID of the asset
  - **name** (string) - The name of the asset
  - **asset_type** (string) - The type of the asset (production_machine)
  - **status** (string) - The status of the asset (idle, working)
  - **alarm_time** (number) - The alarm time of the asset (in seconds)
  - **avg_cycle_time** (number) - The average cycle time of the asset (in seconds)
  - **total_items** (number) - The total items produced by the asset
  - **good_items** (number) - The good items produced by the asset
  - **bad_items** (number) - The bad items produced by the asset
  - **consumption** (number) - The consumption of the asset in the specified time range (in kWh)
  - **cost** (number) - The cost of the consumption of the asset in the specified time range
  - **availability** (number) - The availability of the asset (proportion from 0 to 1)
  - **performance** (number) - The performance of the asset (proportion from 0 to 1)
  - **quality** (number) - The quality of the production processes (proportion from 0 to 1)
  - **oee** (number) - The OEE of the asset, which is the product of the three factors above (proportion from 0 to 1)
  - **oee_timeline** (object[]) - Array of OEE detail objects. The OEE detail object has the following fields:
    - **value** (number) - The OEE value (proportion from 0 to 1)
    - **start** (date) - The start timestamp of the OEE value in RFC3339 format
    - **end** (date) - The end timestamp of the OEE value in RFC3339 format
  - **production_times** (object[]) - Array of production times objects. The production times object has the following fields:
    - **key** (string) - Production time type
    - **value** (number) - Production time value (in seconds)
  - **h_status** (object[]) - Array of status objects. The status object has the following fields:
    - **start** (date) - The start timestamp of the status in RFC3339 format
    - **end** (date) - The end timestamp of the status in RFC3339 format
    - **state** (string) - The status of the asset (idle, working)
  - **item_distribution** (object[]) - Array of item distribution objects. The item distribution object has the following fields:
    - **ts** (date) - The timestamp of the item distribution value in RFC3339 format
    - **good_items** (number) - The good items value
    - **bad_items** (number) - The bad items value
  - **h_consumption** (object[]) - Array of consumption detail objects. The consumption object has the following fields:
    - **ts** (date) - The timestamp of the consumption value in RFC3339 format
    - **value** (number) - The consumption value (in kWh)

#### Example
`GET https://api.cloud.zerynth.com/v3/dashboards/wks-123456789/ast-1234567`

`200 OK`

```json
{
  "productivity": {
    "id": "ast-1234567",
    "name": "Injection Molding Press 2",
    "asset_type": "production_machine",
    "status": "working",
    "alarm_time": 0,
    "avg_cycle_time": 0,
    "total_items": 0,
    "good_items": 0,
    "bad_items": 0,
    "consumption": 0.1687815,
    "cost": 0,
    "availability": 0,
    "performance": 0,
    "quality": 0,
    "oee": 0,
    "oee_timeline": [
      {
        "value": 0,
        "start": "2023-09-28T07:46:00Z",
        "end": "2023-09-28T07:47:00Z"
      },
      {
        "value": 0,
        "start": "2023-09-28T07:47:00Z",
        "end": "2023-09-28T07:48:00Z"
      },
      {
        "value": 0,
        "start": "2023-09-28T07:48:00Z",
        "end": "2023-09-28T07:49:00Z"
      },
      {
        "value": 0,
        "start": "2023-09-28T07:49:00Z",
        "end": "2023-09-28T07:50:00Z"
      },
      {
        "value": 0,
        "start": "2023-09-28T07:50:00Z",
        "end": null
      }
    ],
    "production_times": [
      {
        "key": "planned_production_time",
        "value": 300
      },
      {
        "key": "run_time",
        "value": 0
      },
      {
        "key": "net_run_time",
        "value": 0
      },
      {
        "key": "fully_productive_time",
        "value": 0
      }
    ],
    "h_status": [
      {
        "start": "2023-09-28T07:44:22Z",
        "end": "2023-09-28T07:56:26Z",
        "state": "idle"
      }
    ],
    "item_distribution": [
      {
        "ts": "2023-09-28T07:46:00Z",
        "good_items": 0,
        "bad_items": 0
      },
      {
        "ts": "2023-09-28T07:47:00Z",
        "good_items": 0,
        "bad_items": 0
      },
      {
        "ts": "2023-09-28T07:48:00Z",
        "good_items": 0,
        "bad_items": 0
      },
      {
        "ts": "2023-09-28T07:49:00Z",
        "good_items": 0,
        "bad_items": 0
      },
      {
        "ts": "2023-09-28T07:50:00Z",
        "good_items": 0,
        "bad_items": 0
      }
    ],
    "h_consumption": [
      {
        "ts": "2023-09-28T07:46:00+00:00",
        "value": 3.38746
      },
      {
        "ts": "2023-09-28T07:47:00+00:00",
        "value": 2.60576
      },
      {
        "ts": "2023-09-28T07:48:00+00:00",
        "value": 1.44002
      },
      {
        "ts": "2023-09-28T07:49:00+00:00",
        "value": 1.37969
      },
      {
        "ts": "2023-09-28T07:50:00+00:00",
        "value": 1.31396
      }
    ]
  }
}
```

## Maintenance APP

### Operators
`GET /workspaces/{workspace_id}/factory/operators`

#### Response
- **operators** (object[]) Array of operator objects. The operator object has the following fields:
  - **id** (string) - The ID of the operator
  - **workspace_id** (string) - The ID of the workspace
  - **code** (string) - The code of the operator
  - **name** (string) - The name of the operator
  - **last_name** (string) - The last name of the operator
  - **email** (string) - The email of the operator
  - **created_at** (date) - The creation timestamp of the operator in RFC3339 format

#### Example
`GET https://api.cloud.zerynth.com/v3/workspaces/wks-123456789/factory/operators`

`200 OK`

```json
[
  {
    "id": "opr-8b9s78u5mo04",
    "workspace_id": "wks-82yp5m2wi7sx",
    "code": "0040",
    "name": "Demo",
    "last_name": "Operator",
    "email": "demo@zerynth.com",
    "created_at": "2023-08-28T09:00:00Z"
  }
]
```
### Maintenance Overview
`GET /workspaces/{workspace_id}/maintenances`

#### Response
- **status** (object[]) Array of status objects in the response. The status object has the following fields:
  - **asset_id** (string) - The ID of the asset
  - **asset_name** (string) - The name of the asset
  - **asset_type** (string) - The type of the asset (service_machine, production_machine, cabinet)
  - **periodic_maintenance_time** (number) - The periodic maintenance time of the asset (in seconds)
  - **working_time_target** (number) - The working time target of the asset (in seconds)
  - **working_time** (number) - The working time of the asset (in seconds)
  - **last_maintenance** (date) - The last maintenance timestamp of the asset in RFC3339 format
  - **working_time_maintenance_condition** (number) - The working time maintenance condition of the asset (in percentage)
  - **periodic_time_maintenance_condition** (number) - The periodic time maintenance condition of the asset (in percentage)
  - **working_time_left** (number) - The working time left of the asset (in seconds)
  - **periodic_time_left** (number) - The periodic time left of the asset (in seconds)
  - **next_maintenance_date** (date) - The next scheduled maintenance date of the asset in RFC3339 format

#### Example
`GET https://api.cloud.zerynth.com/v3/workspaces/wks-123456789/maintenances`

`200 OK`

```json
{
  "status": [
    {
      "asset_id": "ast-1234567",
      "asset_name": "Ventilation System",
      "asset_type": "service_machine",
      "periodic_maintenance_time": 8640000,
      "working_time_target": 3600000,
      "working_time": 60,
      "last_maintenance": "2023-09-28T09:07:29.135Z",
      "working_time_maintenance_condition": 0,
      "periodic_time_maintenance_condition": 0,
      "working_time_left": 3599940,
      "periodic_time_left": 8639928,
      "next_maintenance_date": "2024-01-06T09:07:29.135Z"
    },
    {
      "asset_id": "ast-1234568",
      "asset_name": "Injection Molding Press 1",
      "asset_type": "production_machine",
      "periodic_maintenance_time": 8640000,
      "working_time_target": 3600000,
      "working_time": 664400,
      "last_maintenance": "2023-08-31T12:47:48.541Z",
      "working_time_maintenance_condition": 18,
      "periodic_time_maintenance_condition": 28,
      "working_time_left": 2935600,
      "periodic_time_left": 6233947,
      "next_maintenance_date": "2023-12-09T12:47:48.541Z"
    },
    {
      "asset_id": "ast-1234569",
      "asset_name": "Injection Molding Press 2",
      "asset_type": "production_machine",
      "periodic_maintenance_time": 8640000,
      "working_time_target": 3600000,
      "working_time": 667592,
      "last_maintenance": "2023-07-06T13:52:54Z",
      "working_time_maintenance_condition": 19,
      "periodic_time_maintenance_condition": 84,
      "working_time_left": 2932408,
      "periodic_time_left": 1399453,
      "next_maintenance_date": "2023-10-14T13:52:54Z"
    },
    {
      "asset_id": "ast-1234560",
      "asset_name": "Production Area 1",
      "asset_type": "cabinet",
      "periodic_maintenance_time": 8640000,
      "working_time_target": 3600000,
      "working_time": 0,
      "last_maintenance": "2023-08-22T02:48:22.423Z",
      "working_time_maintenance_condition": 0,
      "periodic_time_maintenance_condition": 37,
      "working_time_left": 3600000,
      "periodic_time_left": 5420381,
      "next_maintenance_date": "2023-11-30T02:48:22.423Z"
    }
  ]
}
```

### Maintenance History
`GET /workspaces/{workspace_id}/maintenances/{machine_id}`

#### Response
- **history** (object[]) Array of maintenance history objects in the response. The maintenance history object has the following fields:
  - **ts_maintenance** (date) - The timestamp of the maintenance in RFC3339 format
  - **asset_id** (string) - The ID of the asset
  - **asset_name** (string) - The name of the asset
  - **asset_type** (string) - The type of the asset (service_machine, production_machine, cabinet)
  - **notes** (string) - The notes of the maintenance
  - **operator_id** (string) - The ID of the operator
  - **operator_name** (string) - The name of the operator
  - **operator_surname** (string) - The last name of the operator
  - **maintenance_done** (boolean) - A flag that indicates whether the maintenance was completed or not

#### Example
`GET https://api.cloud.zerynth.com/v3/workspaces/wks-123456789/maintenances/ast-1234567`

`200 OK`

```json
{
  "history": [
    {
      "ts_maintenance": "2023-09-28T09:07:29.135Z",
      "asset_id": "ast-1234567",
      "asset_name": "Ventilation System",
      "asset_type": "service_machine",
      "notes": "Routine check",
      "operator_id": "opr-987654321",
      "operator_name": "Demo",
      "operator_surname": "Operator",
      "maintenance_done": true
    }
  ]
}
```

### Add Maintenance Intervention
`POST /workspaces/{workspace_id}/maintenances`
#### Request
```json
{
  "asset_id": "ast-1234567",
  "description": "Intervention description",
  "maintenance_done": true,
  "operator": "opr-987654321",
  "ts_maintenance": "2023-09-28T09:07:29.135Z"
}
```
#### Response
- **error** (string) - An error message which displays in case the request was not carried out correctly
- **msg** (string) - An information message which displays when the request was carried out successfully


#### Example
`POST https://api.cloud.zerynth.com/v3/workspaces/wks-123456789/maintenances`

`200 OK`

```json
{
  "error": null,
  "msg": "Operation completed successfully"
}
```