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

resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  timeouts {
    create = local.timeouts.create
    delete = local.timeouts.delete
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 256
  engine               = "postgres"
  engine_version       = "9.5.4"
  instance_class       = "db.r3.large"
  db_name              = "data-dump"
  username             = "user1"
  password             = "passwd"
  parameter_group_name = "mydb"
  timeouts {
    create = local.timeouts.create
    delete = local.timeouts.delete
  }
}