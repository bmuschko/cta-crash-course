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