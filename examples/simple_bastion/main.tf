###
#
# example for bastion creation
#

# parameter for OTC cloud provisioner

provider "opentelekomcloud" {
  auth_url    = var.identity_endpoint
  access_key  = var.access_key
  secret_key  = var.secret_key
  domain_name = var.domain_name
  tenant_name = var.tenant_name
}

## get our configuration

locals {
  system             = jsondecode(file("../../assets/system.json"))
  stage              = format("%s_%s", local.system["env_stage"], local.system["workspace"])
  bastion_key_name   = format("%s_%s", local.stage, local.system["bastion_key_name"])
  bastion_public_key = format("../../assets/%s.pub", local.system["bastion_key_name"])
}

# network and subnet are prerequisites

module "vpc" {
  source  = "app.terraform.io/selfscrum/vpc/opentelekomcloud"
  version = "0.1.4"

  stage        = local.stage
  vpc_cidr     = local.system["vpc_cidr"]
  public_cidr  = local.system["public_cidr"]
  private_cidr = local.system["private_cidr"]
}

module "bastion" {
  source           = "../../../terraform-opentelekomcloud-bastion"
  stage            = local.stage
  public_subnet_id = module.vpc.public_subnet_id
  key_name         = local.bastion_key_name
  key_file         = local.bastion_public_key
  image_name       = local.system["bastion_image_name"]
  vcpus            = local.system["bastion_vcpus"]
  ram              = local.system["bastion_ram"]
  init_script      = local.system["bastion_init_script"]
  ssh_user_name    = local.system["bastion_ssh_user_name"]
}

output "public_ip" { value = module.bastion.public_ip }
output "private_ip" { value = module.bastion.private_ip }
output "security_group_id" { value = module.bastion.private_ip }
