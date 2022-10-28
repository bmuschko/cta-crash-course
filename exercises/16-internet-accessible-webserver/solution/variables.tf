variable "profile_name" {
  type    = string
  default = "default"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "vpc_cidr" {
  type    = string
  default = "178.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "178.0.10.0/24"
}