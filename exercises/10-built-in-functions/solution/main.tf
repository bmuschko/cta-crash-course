variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "A network address prefix in CIDR notation"
}

locals {
  private_subnets = [
    cidrsubnet(var.cidr, 8, 1),
    cidrsubnet(var.cidr, 8, 2),
    cidrsubnet(var.cidr, 8, 3)
  ]

  public_subnets = [
    cidrsubnet(var.cidr, 8, 4),
    cidrsubnet(var.cidr, 8, 5),
    cidrsubnet(var.cidr, 8, 6)
  ]
}

output "public_subnets" {
  value       = local.public_subnets
  description = "Computed public subnet CIDR blocks"
}

output "private_subnets" {
  value       = local.private_subnets
  description = "Computed private subnet CIDR blocks"
}