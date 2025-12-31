# Solution

Run the commands for deploying the EC2 instance on AWS.

```
$ terraform init
$ terraform plan
$ terraform apply
```

Open a browser and enter the URL [https://aws.amazon.com/](https://aws.amazon.com/). Log into your account. Navigate to _My Account > AWS Management Console_. Open the EC2 Dashboard. You should find the running EC2 instance you just created. Get the value for the column "Instance ID". For the purpose of explaining the import workflow, we'll use the instance ID `i-0651c2edd7dc884ac`.

Remove the instance from the local state with the following command.

```
$ terraform state rm aws_instance.app_server
Removed aws_instance.app_server
Successfully removed 1 resource instance(s).
```

Delete the following section from the `main.tf` file.

```terraform
resource "aws_instance" "app_server" {
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
}
```

The state should render empty output now that you remove the EC2 instance.

```
$ terraform show
```

With the empty state as a starting point, we'll try to import the EC2 instance that still exists on AWS. As you can see from the output, Terraform will want you to add the configuration first.

```
$ terraform import aws_instance.app_server i-0651c2edd7dc884ac
Error: resource address "aws_instance.app_server" does not exist in the configuration.

Before importing this resource, please create its configuration in the root module. For example:

resource "aws_instance" "app_server" {
  # (resource arguments)
}
```

Add the following configuration to `main.tf`. Do not define any additional resource arguments yet.

```terraform
resource "aws_instance" "app_server" {
}
```

Run the `import` command again. Terraform will add the EC2 instance to the local state file.

```
$ terraform import aws_instance.app_server i-0651c2edd7dc884ac
aws_instance.app_server: Importing from ID "i-0651c2edd7dc884ac"...
aws_instance.app_server: Import prepared!
  Prepared aws_instance for import
aws_instance.app_server: Refreshing state... [id=i-0651c2edd7dc884ac]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

You can verify that the instance is available with the following command.

```
$ terraform state show aws_instance.app_server
# aws_instance.app_server:
resource "aws_instance" "app_server" {
    ...
}
```

Running the `plan` command will tell you about the attributes that still need to be defined in the configuration file.

```
$ terraform plan
╷
│ Error: Missing required argument
│
│   with aws_instance.app_server,
│   on main.tf line 19, in resource "aws_instance" "app_server":
│   19: resource "aws_instance" "app_server" {
│
│ "instance_type": one of `instance_type,launch_template` must be specified
╵
╷
│ Error: Missing required argument
│
│   with aws_instance.app_server,
│   on main.tf line 19, in resource "aws_instance" "app_server":
│   19: resource "aws_instance" "app_server" {
│
│ "ami": one of `ami,launch_template` must be specified
╵
╷
│ Error: Missing required argument
│
│   with aws_instance.app_server,
│   on main.tf line 19, in resource "aws_instance" "app_server":
│   19: resource "aws_instance" "app_server" {
│
│ "launch_template": one of `ami,instance_type,launch_template` must be specified
```

Define the attributes for the resource in `main.tf`.

```terraform
resource "aws_instance" "app_server" {
  ami = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
}
```

The `plan` command will be satisfied with the current state.

```
$ terraform plan
aws_instance.app_server: Refreshing state... [id=i-0651c2edd7dc884ac]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no
differences, so no changes are needed.
```

The `apply` command will not need to make any additional changes.

```
$ terraform apply
aws_instance.app_server: Refreshing state... [id=i-0651c2edd7dc884ac]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no
differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

The `destroy` command will delete the instance.

```
terraform destroy
aws_instance.app_server: Refreshing state... [id=i-0651c2edd7dc884ac]

Terraform used the selected providers to generate the following execution plan. Resource actions
are indicated with the following symbols:
  - destroy
...
aws_instance.app_server: Destroying... [id=i-0651c2edd7dc884ac]
aws_instance.app_server: Still destroying... [id=i-0651c2edd7dc884ac, 10s elapsed]
aws_instance.app_server: Still destroying... [id=i-0651c2edd7dc884ac, 20s elapsed]
aws_instance.app_server: Still destroying... [id=i-0651c2edd7dc884ac, 30s elapsed]
aws_instance.app_server: Destruction complete after 40s

Destroy complete! Resources: 1 destroyed.
```
