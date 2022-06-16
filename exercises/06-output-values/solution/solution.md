# Solution

Create the file named `outputs.tf`.

```
$ touch outputs.tf
```

Define the output value.

```
output "app_server_public_ip" {
  value = aws_instance.app_server.public_ip
  description = "The public IP address of the EC2 server instance."
}
```

The `plan` command will tell you about the added output value.

```
$ terraform plan
...

Changes to Outputs:
  + app_server_public_ip = (known after apply)
```

The `output` command does not have the produced value in the state database yet. You will need to run the `apply` command first.

```
$ terraform output
╷
│ Warning: No outputs found
│
│ The state file either has no outputs defined, or all the defined outputs are empty. Please define an output in
│ your configuration with the `output` keyword and run `terraform refresh` for it to become available. If you are
│ using interpolation, please verify the interpolated value is not empty. You can use the `terraform console`
│ command to assist.
╵
```