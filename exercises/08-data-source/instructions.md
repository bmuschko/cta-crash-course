# Exercise 8

In this exercise, you will define a data source for consuming a response from a HTTP call. The response should be parsed and used as an output value.

> **_NOTE:_** The warning message you'll see in the console output is a known issue in the provider. The project has a [pending pull request](https://github.com/hashicorp/terraform-provider-http/pull/158) to get it fixed.

1. Create a new configuration file named `main.tf`.
2. Define a data source named `weather` using the [hashicorp/http](https://registry.terraform.io/providers/hashicorp/http/latest) provider with version 3.2.1.
3. Assign the URL `https://api.weather.gov/points/39.73,-104.99` and declare the `application/geo+json` request header.
4. Define the output value named `city` that consumes the response body of the data source. Parse the value of the city attribute from the response body using the built-in function [jsondecode](https://www.terraform.io/language/functions/jsondecode).
5. Execute the `terraform plan` command and find the output value in the console output.
