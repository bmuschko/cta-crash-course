variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "A network address prefix in CIDR notation"
}

output "public_subnets" {
  value       = local.public_subnets
  description = "Computed public subnet CIDR blocks"
}

output "private_subnets" {
  value       = local.private_subnets
  description = "Computed private subnet CIDR blocks"
}