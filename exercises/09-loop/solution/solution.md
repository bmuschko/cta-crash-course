# Solution

Start by defining the input variable named `instance_count`.

```terraform
variable "instance_count" {
    type = number
    description = "The number of EC2 instances to be managed."
    default = 3
}
```

To use the count syntax, simply assign the variable named `instance_count` to the `count` attribute.

```terraform
resource "aws_instance" "app_server" {
  count = var.instance_count
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
    Name = "instance ${count.index}"
  }
}
```

The `plan` command uses the default value 3 if the value of the input variable has not been provided. You can control the number of instances by setting a variable value other than 3.

```
$ terraform plan
...
Plan: 3 to add, 0 to change, 0 to destroy.

$ terraform plan -var='instance_count=5'
...
Plan: 5 to add, 0 to change, 0 to destroy.
```
