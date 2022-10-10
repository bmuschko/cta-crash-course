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