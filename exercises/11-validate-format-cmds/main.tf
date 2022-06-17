terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.17.1"
    }
  }
}

provider "aws"
{
      region = "us-west-2"
      access_key = "abc"
      secret_key = "def"
}

resource "aws_instance" "app_server" {
  ami = var_ami_id
  instance_type = var.instance_type
  tags = [var.tags]
}