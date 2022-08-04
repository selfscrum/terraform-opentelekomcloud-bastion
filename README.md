# terraform-opentelekomcloud-bastion

Create a bastion host for the given vpc, together with the appropriate security group.
This module work best together with a vpc created by `selfscrum / vpc`.

## Need

Having the possibility to access a protected VPC's resources without permanent DNAT rules.

1. You need a public/private keypair locally.
2. You need an VPC with a public subnet.

## Solution 

This module builds a bastion host with a connection to a subnet in the VPC.

## Configuration

I use a JSON file to do all my project configurations. IT is located in `assets\system.json`. Adopt to your needs. In this directory you find also the `example-secret.tfvars` file template which you need to fill with your data and another template called `test-secret.tfvars` to point your test environment to another OTC account or tenant. However, you can us the same account for example and test at the same time. Alle resources are fully namespace. 

If you like you can modify the install script for your bastion image which will run with sudo. It is referenced in the `system.json`file.

## Test

The module has a unit test built with terratest. It provisions a test environment with the `simple-bastion` example, validates some the module's outputs with some simple checks, and destroys the test system again. if successful, the test returns 0.

## Run

Start the example from within the `examples/simple_bastion` directory. 

```
terraform apply -var-file="../../assets/example-secret.tfvars"
```

If successful you should get an image name, and the path to a local private key file. 

You can (and should) destroy the provisioned infrastructure after your experiments. 

```
terraform destroy -var-file="../../assets/dev-secret.tfvars" -auto-approve
```
