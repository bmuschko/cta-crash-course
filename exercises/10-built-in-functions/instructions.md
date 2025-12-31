# Exercise 10

In this exercise, you will create public and private subnets from a CIDR block without hard-coding the values. Instead you will use the [`cidrsubnet`](https://developer.hashicorp.com/terraform/language/functions/cidrsubnet) function to create network spaces programmatically.

1. Inspect the existing configuration in the file named [`main.tf`](./main.tf).
2. Create a local variable named `private_subnets`. Use the `cidrsubnet` function to compute 3 new subnet addresses within given IP network address prefix. Use the input variable `cidr` as a starting point, add 8 as the number of additional bits, and start with 1 as the whole number that can be represented as a binary integer.
3. Create a local variable named `public_subnets`. Use the `cidrsubnet` function to compute 3 new subnet addresses within given IP network address prefix. Use the input variable `cidr` as a starting point, add 8 as the number of additional bits, and start with 4 as the whole number that can be represented as a binary integer.
4. Execute the `plan` command. What CIDRs do you expect to be generated?
