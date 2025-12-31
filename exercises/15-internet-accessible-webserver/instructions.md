# Exercise 15

In this exercise, you will put everything you learned so far together. You'll create the infrastructure pieces that run the Apache web server on AWS. The web server should become accessible from the internet.

1. Define the AWS provider with the latest version in the 4.x range.
2. Create the following resources and tie them together properly.
  * A VPC using the [`aws_vpc`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) resource. Configure the CIDR to `178.0.0.0/16`.
  * A VPC Internet Gateway using the [`aws_internet_gateway`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) resource.
  * A VPC subnet resource using the [`aws_subnet`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) resource. Set the availability zone to `us-west-2a` and map the public IP on launch.
  * A VPC routing table using the [`aws_route_table`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) resource. Set the CIDR to `0.0.0.0/0`.
  * A resource to create an association between a route table and a subnet or a route table and an internet gateway or virtual private gateway using [`aws_route_table_association`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association).
  * A security group resource using [`aws_security_group`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group). Configure SSH and HTTP as ingress. Disallow any egress traffic.
  * An EC2 instance using the [`aws_instance`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) resource. Use the AMI `ami-0d70546e43a941d70`, the EC2 type `t2.micro`, and wire up the networking resources. Install the Apache web server on the EC2 instance.
3. Make the configuration changeable by the end user via input variables. Assign default values.
4. Define an output value that renders the public IP of the EC2 instance on the console.
5. Deploy the infrastructure using Terraform.
6. Open a browser and render the Apache web server default web page.
7. Destroy the infrastructure with Terraform.