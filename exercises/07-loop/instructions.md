# Exercise 7

In this exercise, you will define an input variable used for defining a loop using the count syntax.

1. Inspect the existing configuration in the file named `main.tf`.
2. Create an input variable named `instance_count` with the data type `number`. Define the number 3 as the default value for the input variable.
3. Specify that instances of the `aws_instance` should be created using the count syntax. Add a tag named `Name` for each instance that uses the current count index in its assigned value.
4. Execute the `plan` command by providing no value for the `instance_count` input variable, and 5 to define a value explicitly.
