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

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = local.instance_config[terraform.workspace].instance_type
  tags = merge(var.tags, { Environment=local.instance_config[terraform.workspace].env })
}