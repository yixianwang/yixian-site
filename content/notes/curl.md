+++
title = 'Curl'
date = 2025-05-26T21:09:13-04:00
+++

## Syntax
- `-X`, --request, HTTP method to be used.
- `-i`, --include, Include the response header.
- `-d`, --data, Data to be sent in the API.
- `-H`, --header, Any additional headers to be sent.

## Api testing with Scripts
- `pip install pyyaml`

```yaml {filename="apis.yaml"}
- name: Get User
  method: GET
  url: https://api.example.com/users/{userId}
  path_params:
    userId: 123
  query_params:
    verbose: true
  headers:
    Authorization: Bearer <TOKEN>

- name: Create User
  method: POST
  url: https://api.example.com/users
  headers:
    Authorization: Bearer <TOKEN>
    Content-Type: application/json
  payload:
    name: John Doe
    email: john@example.com
```

```python {filename="generate_curl.py"}
import yaml
import json
import urllib.parse

def load_api_definitions(file_path):
    with open(file_path, 'r') as f:
        return yaml.safe_load(f)

def build_curl_command(api):
    method = api.get("method", "GET").upper()
    url = api["url"]

    # Replace path parameters
    if "path_params" in api:
        for key, value in api["path_params"].items():
            url = url.replace(f"{{{key}}}", str(value))

    # Add query parameters
    if "query_params" in api:
        query_string = urllib.parse.urlencode(api["query_params"])
        url += f"?{query_string}"

    curl_cmd = f"curl -X {method} '{url}'"

    # Headers
    headers = api.get("headers", {})
    for key, value in headers.items():
        curl_cmd += f" -H '{key}: {value}'"

    # Payload
    if "payload" in api and method in ["POST", "PUT", "PATCH"]:
        payload_str = json.dumps(api["payload"])
        curl_cmd += f" -d '{payload_str}'"

    return curl_cmd

def generate_curl_scripts(api_file_path, output_script_path):
    apis = load_api_definitions(api_file_path)
    with open(output_script_path, 'w') as f:
        f.write("#!/bin/bash\n\n")
        for api in apis:
            f.write(f"# {api.get('name', 'Unnamed API')}\n")
            curl_cmd = build_curl_command(api)
            f.write(curl_cmd + "\n\n")
    print(f"✅ Generated cURL script: {output_script_path}")

# Run the generator
if __name__ == "__main__":
    generate_curl_scripts("apis.yaml", "run_api_tests.sh")
```

```bash {filename="run_api_tests.sh"}
#!/bin/bash

# Get User
curl -X GET 'https://api.example.com/users/123?verbose=true' -H 'Authorization: Bearer <TOKEN>'

# Create User
curl -X POST 'https://api.example.com/users' -H 'Authorization: Bearer <TOKEN>' -H 'Content-Type: application/json' -d '{"name": "John Doe", "email": "john@example.com"}'
```