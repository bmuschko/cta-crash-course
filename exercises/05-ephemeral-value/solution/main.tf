terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

ephemeral "random_password" "db" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "db" {
  name = "db-password"
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id             = aws_secretsmanager_secret.db.id
  secret_string_wo      = ephemeral.random_password.db.result
  secret_string_wo_version = 1
}

resource "aws_db_instance" "main" {
  identifier        = "main-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username            = "admin"
  password_wo         = ephemeral.random_password.db.result
  password_wo_version = 1

  skip_final_snapshot = true
}