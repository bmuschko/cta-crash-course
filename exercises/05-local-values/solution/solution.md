# Solution

Create the file named `locals.tf`.

```
$ touch locals.tf
```

Define the local values.

```terraform
locals {
  timeouts = {
    create = "60m"
    delete = "2h"
  }
}
```

Consume the local values in the resource definition in the file `main.tf`.

```terraform
resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  timeouts {
    create = local.timeouts.create
    delete = local.timeouts.delete
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 256
  engine               = "postgres"
  engine_version       = "9.5.4"
  instance_class       = "db.r3.large"
  db_name              = "data-dump"
  username             = "user1"
  password             = "passwd"
  parameter_group_name = "mydb"
  timeouts {
    create = local.timeouts.create
    delete = local.timeouts.delete
  }
}
```

Execute the `plan` command. You should see the timeout values in the output of the command.

```
$ terraform plan
```
