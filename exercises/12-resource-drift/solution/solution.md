# Solution

Create the EC2 instance on AWS with the following commands:

```
$ terraform init
$ terraform apply
```

You should be able to find the provisioned EC2 instance in the AWS dashboard.

![ec2-instance](./imgs/ec2-instance.png)

Add the new tags under _Tags > Manage Tags_ for the EC2 instance.

![manage-tags](./imgs/manage-tags.png)

Execute the `plan` command. The command output indicates the changes that happened in the cloud. The `plan` command automatically compared the local state with the current state in the cloud.

```
$ terraform plan
aws_instance.app_server: Refreshing state... [id=i-0b7c0e5c308a5842f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # aws_instance.app_server will be updated in-place
  ~ resource "aws_instance" "app_server" {
        id                                   = "i-0b7c0e5c308a5842f"
      ~ tags                                 = {
          - "Author"  = "John Doe" -> null
          - "Service" = "Backend" -> null
        }
      ~ tags_all                             = {
          - "Author"  = "John Doe"
          - "Service" = "Backend"
        } -> (known after apply)
        # (28 unchanged attributes hidden)

        # (6 unchanged blocks hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.
```

If you were to run `apply` as-is, then the operation would remove the tags of the EC2 instance in AWS as the Terraform configuration files doesn't declare them.

Add the tags to the EC2 resource definition in `main.tf` to reflect the actual state in the cloud. It could look as follows:

```terraform
resource "aws_instance" "app_server" {
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
    "Service": "Backend",
    "Author": "John Doe"
  }
}
```

The `plan` and `apply` commands will not require any changes to the infrastructure.

```
$ terraform plan
aws_instance.app_server: Refreshing state... [id=i-0b7c0e5c308a5842f]

No changes. Your infrastructure matches the configuration.

$ terraform apply
aws_instance.app_server: Refreshing state... [id=i-0b7c0e5c308a5842f]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

At this time, you'd usually commit and push the changes to version control.
