# Authentication
The **Zerynth Device Manager REST APIs** offer access to devices, job and FOTA services, as well as workspaces and fleets.
This API can be called from any application that can send an HTTPS request and receive an HTTPS response.

!!! note "HTTPS only"
		All requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.
	- Set the **Content-Type** header to **application/json**.
	- Set the **X-API-KEY** header to a valid API Key. For information about how to get an API key, see [Authentication](#create_api_key).

## Authentication
Zerynth Device Manager grants access to endpoints by verifying an API key.

The API key is a unique identifier that authenticates your requests and it is bound to a single workspace.

### <a name="create_api_key"></a>Create an API key

To create an API key:

1. Login to [Zerynth Device Manager](https://zdm.zerynth.com).
2. Choose a workspace.
3. Go to the **Settings** page.
4. Click on **New API key**. Choose a name for the API key and click **OK**
5. The newly created API key is now showed.

### Using the API key

You must include a valid API key with every request. In the following example, replace `YOUR_API_KEY` with your API key.

```bash
curl --request GET \
  --url https://api.zdm.zerynth.com/v3/workspaces/ \
  --header 'X-API-KEY: YOUR_API_KEY'
```