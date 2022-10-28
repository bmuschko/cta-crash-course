# Solution

You can find the relevant Terraform configuration files in the [current directory](.).

Deploy the infrastructure. The public IP address will be rendered in the console.

```
$ terraform apply
...
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

web_instance_ip = "34.209.48.125"
```

You should be able to access the Apache web server after the a couple of seconds. In the output above, the public IP address is `34.209.48.125`.

![apache-default-page](./imgs/apache-default-page.png)

Destroy all resources once you are done.

```
$ terraform destroy
```