# Solution

Define a local variable named `private_subnets` and `public_subnets`. Assign a list of strings. Each item in the list needs to use the `cidrsubnet` function. Feed in the value of the `cidr` input variable as `prefix` attribute for the function. The `newbits` attribute needs to use the value 8. Assign a counting integer to the `netnum` attribute starting with the number 0.

```terraform
locals {
  private_subnets = [
    cidrsubnet(var.cidr, 8, 1),
    cidrsubnet(var.cidr, 8, 2),
    cidrsubnet(var.cidr, 8, 3)
  ]

  public_subnets = [
    cidrsubnet(var.cidr, 8, 4),
    cidrsubnet(var.cidr, 8, 5),
    cidrsubnet(var.cidr, 8, 6)
  ]
}
```

The resulting execution of the `plan` command will generate 3 private subnets and 3 public subnets.

```
$ terraform plan

Changes to Outputs:
  + private_subnets = [
      + "10.0.1.0/24",
      + "10.0.2.0/24",
      + "10.0.3.0/24",
    ]
  + public_subnets  = [
      + "10.0.4.0/24",
      + "10.0.5.0/24",
      + "10.0.6.0/24",
    ]
```