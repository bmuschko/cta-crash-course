terraform {
  required_providers {
    http = {
      source = "hashicorp/http"
      version = "3.2.1"
    }
  }
}

data "http" "weather" {
  url = "https://api.weather.gov/points/39.73,-104.99"

  request_headers = {
    "Accept" = "application/geo+json"
  }
}

output "city" {
  value = jsondecode(data.http.weather.response_body).properties.relativeLocation.properties.city
}
