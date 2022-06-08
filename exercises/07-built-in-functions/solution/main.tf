terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

variable "instance_count" {
    type = number
    description = "The numer of EC2 instances to be managed."
    default = 3
}

# Count syntax
/*resource "aws_instance" "app_server" {
  count = var.instance_count
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
    Name = "instance ${count.index}"
  }
}*/

# For each syntax
resource "aws_instance" "app_server" {
  for_each = toset([for i in range(0, var.instance_count) : tostring(i + 1)])
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
      Name = "instance ${each.key}"
  }
}