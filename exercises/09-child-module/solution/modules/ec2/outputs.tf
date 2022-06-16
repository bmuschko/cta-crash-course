output "app_server_private_ip" {
  value = aws_instance.app_server.private_ip
  description = "The private IP address of the EC2 server instance."
}
