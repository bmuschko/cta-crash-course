# Exercise 13

In this exercise, you will manage resource drift that can occur if a resource under Terraform's control has been changed manually in the cloud environment.

1. In the current directory, run the `init` and `apply` command to create the resources need to set up the scenario.
2. Open the AWS dashboard and find the created resource.
3. Add two tags to the resource manually from the AWS dashboard: `Service = Backend`, `Author = John Doe`.
4. Run the `plan` command. What do you see?
5. Reconcile the local state with the actual configuration in AWS. Ensure that the `apply` command reports with "no changes needed".
