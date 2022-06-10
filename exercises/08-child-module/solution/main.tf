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

module "app_server" {
  source = "./modules/ec2"
  ami_id = "ami-077ee47512dc6f3ca"
  tags = { Name: "App Server" }
}