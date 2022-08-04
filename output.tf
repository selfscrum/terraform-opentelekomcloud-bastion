output "public_ip" {
  value       = opentelekomcloud_networking_floatingip_v2.bastion_public_ip.address
  description = "Public IP of bastion"
}

output "private_ip" {
  value       = opentelekomcloud_compute_instance_v2.bastion.access_ip_v4
  description = "Private IP of bastion"
}

output "security_group_id" {
  value       = opentelekomcloud_networking_secgroup_v2.nc_ssh_bastion_sg.id
  description = "Security group that controls access to bastion"
}
