# Solution

Start by creating both workspaces.

```
$ terraform workspace new dev
Created and switched to workspace "dev"!
$ terraform workspace new prod
Created and switched to workspace "prod"!
```

Create a new file `locals.tf` and add the workspace configuration there. You should end up with the following definition.

```terraform
locals {
  instance_config = {
    dev = {
      instance_type = "t2.nano"
      env = "development"
    },
    prod = {
      instance_type = "t2.micro"
      env = "production"
    }
  }
}
```
To use the local variables, simply use the `local` prefix. The local variable is of type `map` so you can pick the relevant workspace configuration by passing in the currently-selected workspace using the `terraform.workspace` variable. The input variable `tags` should still ask the end user for a value. You can merge the provided value with the environment-specific value by using the built-in `merge` function.

```terraform
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = local.instance_config[terraform.workspace].instance_type
  tags = merge(var.tags, { Environment=local.instance_config[terraform.workspace].env })
}
```

Select the `dev` workspace and run the `plan` command. The configuration values for the development workspace should be applied.

```
$ terraform workspace select dev
Switched to workspace "dev".
$ terraform plan

var.tags
  The tags assigned to the EC2 instance.

  Enter a value: {"Service": "hello"}
  ...
  # aws_instance.app_server will be created
    + resource "aws_instance" "app_server" {
      + instance_type                        = "t2.nano"
      ...
      + tags                                 = {
        + "Environment" = "development"
        + "Service"     = "hello"
      }
    }
    ...
  }
}
```

Switch to the `prod` workspace and run the `plan` command. The configuration values for the production workspace should be applied.

```
$ terraform workspace select prod
Switched to workspace "prod".
$ terraform plan

var.tags
  The tags assigned to the EC2 instance.

  Enter a value: {"Service": "hello"}
  ...
  # aws_instance.app_server will be created
    + resource "aws_instance" "app_server" {
      + instance_type                        = "t2.micro"
      ...
      + tags                                 = {
        + "Environment" = "production"
        + "Service"     = "hello"
      }
    }
    ...
  }
}
```

Change to the `default` workspace before deleting the `dev` and `prod` workspaces.

```
$ terraform workspace select default
Switched to workspace "default".
$ terraform workspace delete dev
Deleted workspace "dev"!
$ terraform workspace delete prod
Deleted workspace "prod"!
```