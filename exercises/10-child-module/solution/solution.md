# Solution

Start by creating the subdirectory `modules/ec2`.

```
$ mkdir -p modules/ec2
```

Create the file `variables.tf` in the subdirectory `modules/ec2`. Add the following content.

```terraform
variable "ami_id" {
    type = string
    description = "The AMI identifier to use for EC2 instance."
    default = "ami-077ee47512dc6f3ca"
    nullable = false
}

variable "tags" {
    type = map(string)
    description = "The tags assigned to the EC2 instance."
}
```

Create the file `main.tf` in the subdirectory `modules/ec2`. Add the following content.

```terraform
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = "t2.nano"
  tags = var.tags
}
```

Create the file `outputs.tf` in the subdirectory `modules/ec2`. Add the following content.


```terraform
output "app_server_private_ip" {
  value = aws_instance.app_server.private_ip
  description = "The private IP address of the EC2 server instance."
}
```

Modify the `main.tf` in the root module by replacing the `resource` definition with a `module` definition. The module's `source` attribute needs to point to the local path of the child module. Make sure to start with a dot character to indicate that you are referencing a local path. Assign the values to the input variables `ami_id` and `tags`.

```terraform
module "app_server" {
  source = "./modules/ec2"
  ami_id = "ami-077ee47512dc6f3ca"
  tags = { Name: "App Server" }
}
```

The `plan` commahd should succeed and plan a single EC2 instance.

```
$ terraform plan
...
Plan: 1 to add, 0 to change, 0 to destroy.
```