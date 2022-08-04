# Create your specific variable setting

```
{
    "vpc_cidr" : "10.0.0.0/16",
    "public_cidr" : "10.0.1.0/24",
    "private_cidr" : "10.0.0.0/24",

    "env_stage" : "example",
    "workspace" : "bastion",
    "bastion_name" : "bastion",
    "bastion_image_name" : "Standard_Ubuntu_22.04_latest",
    "bastion_ram" : "1024",
    "bastion_vcpus" : 1,
    "bastion_init_script" : "../assets/bastion_init.mm",
    "bastion_ssh_user_name" : "ubuntu",
    "bastion_key_name" : "bastion_key"
}
```