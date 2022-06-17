output "app_server_public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "The public IP address of the EC2 server instance."
}
