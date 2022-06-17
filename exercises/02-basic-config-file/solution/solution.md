# Solution

Create the file named `main.tf`.

```
$ touch main.tf
```

Edit the file and register the AWS provider.

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.16.0"
    }
  }
}
```

Define the provider in the region `us-west-2`. Make sure to use the same name as the registered provider.

```terraform
provider "aws" {
  region = "us-west-2"
}
```

Add the EC2 instance to the configuration with the relevant attribute values.

```terraform
resource "aws_instance" "app_server" {
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
}
```

For testing purposes, set the environment variables for the current shell that define the AWS credentials.

```
$ export AWS_ACCESS_KEY_ID=<access-key-id>
$ export AWS_SECRET_ACCESS_KEY=<secret-access-key>
```