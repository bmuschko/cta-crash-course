# Solution

The following definition of the resource of type `aws_instance` transforms the value of the variable `instance_count`. It uses the `range` function to create a list with the elements 1, 2, and 3. Then it iterates of them with a `for` loop and then turns each element into a string value. Lastly, it changes the data type from list to set. The element value can be retrieved using `each.key` given that we are dealing with a set in the `for_each` loop.

```
resource "aws_instance" "app_server" {
  for_each = toset([for i in range(0, var.instance_count) : tostring(i + 1)])
  ami           = "ami-077ee47512dc6f3ca"
  instance_type = "t2.nano"
  tags = {
      Name = "instance ${each.key}"
  }
}
```

The resulting execution of the `plan` command should render 3 instances that need to be planned out.

```
$ terraform plan
...
Plan: 3 to add, 0 to change, 0 to destroy.
```