# Solution

Create the file named `main.tf`.

```
$ touch main.tf
```

Add the provider with the version 3.2.1.

```terraform
terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "3.2.1"
    }
  }
}
```

Define the data source. Assign the URL and the request header.

```terraform
data "http" "weather" {
  url = "https://api.weather.gov/points/39.73,-104.99"

  request_headers = {
    "Accept" = "application/geo+json"
  }
}
```

Define an output value that consumes the response body provided by the data source. You can navigate the JSON structure by path. Make sure the decode the JSON content using the `jsondecode` function.

```terraform
output "city" {
  value = jsondecode(data.http.weather.response_body).properties.relativeLocation.properties.city
}
```

Executing the `plan` command renders the output. You should see the city `Glendale`.

```
$ terraform plan
data.http.weather: Reading...
data.http.weather: Read complete after 1s [id=https://api.weather.gov/points/39.73,-104.99]

Changes to Outputs:
  + city = "Glendale"

You can apply this plan to save these new output values to the Terraform state, without changing any
real infrastructure.
╷
│ Warning: Content-Type is not recognized as a text type, got "application/geo+json"
│
│   with data.http.weather,
│   on main.tf line 1, in data "http" "weather":
│    1: data "http" "weather" {
│
│ If the content is binary data, Terraform may not properly handle the contents of the response.
╵
```

