# Exercise 8

In this exercise, you will replace a count-style loop with a `for_each` loop. To feed in the data to the loop, you will need to transform the input value with built-in functions.

1. Inspect the existing configuration in the file named `main.tf`.
2. Turn the count syntax used by the `aws_instance` into a `for_each` syntax with the data type `set`.
3. You will need massage the value of the `instance_count` input variable so that it can be assigned. Have a look at the built-in functions [range](https://www.terraform.io/language/functions/range) and [tostring](https://www.terraform.io/language/functions/tostring) for inspiration. Be aware that other solution may work as well.
4. Execute the `plan` command.
