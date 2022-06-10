resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = "t2.nano"
  tags = var.tags
}