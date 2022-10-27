# Solution

Initialize the working directory using the `init` command.

```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "4.16.0"...
- Installing hashicorp/aws v4.16.0...
- Installed hashicorp/aws v4.16.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Validating the configuration file should return with no issues.

```
$ terraform validate
Success! The configuration is valid.
```

Execute the `plan` command to see the changes that can be applied.

```
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.app_server will be created
  + resource "aws_instance" "app_server" {
...
```

The `apply` command will make the changes on AWS.

```
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.app_server will be created
  + resource "aws_instance" "app_server" {
...
```

You should be able to find the provisioned EC2 instance in the AWS dashboard.

![ec2-instance](./imgs/ec2-instance.png)

Delete the existing EC2 instance with the `destroy` command.

```
$ terraform destroy
...

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_instance.app_server: Destroying... [id=i-0e11c52ef4a55367f]
aws_instance.app_server: Still destroying... [id=i-0e11c52ef4a55367f, 10s elapsed]
aws_instance.app_server: Still destroying... [id=i-0e11c52ef4a55367f, 20s elapsed]
aws_instance.app_server: Destruction complete after 30s

Destroy complete! Resources: 1 destroyed.
```