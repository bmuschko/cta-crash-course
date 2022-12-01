# Exercise 10

In this exercise, you will replace a `count`-style loop with a `for_each` loop. To feed in the data to the loop, you will need to transform the input value with built-in functions.

1. Inspect the existing configuration in the file named [`main.tf`](./main.tf).
2. Turn the `count` argument used by the `aws_instance` into a `for_each` argument with the data type `set`.
3. You will need to massage the value of the `instance_count` input variable so that it can be assigned. Have a look at the built-in functions [range](https://developer.hashicorp.com/terraform/language/functions/range), [tostring](https://developer.hashicorp.com/terraform/language/functions/tostring), and [toset](https://developer.hashicorp.com/terraform/language/functions/toset) for inspiration. Be aware that other solutions may work as well.
4. Execute the `plan` command.
