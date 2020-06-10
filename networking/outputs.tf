output "bastion_subnet_id" {
  value = ibm_is_subnet.vpc_secure_bastion_subnet.id
}

output "private_subnet_id" {
  value = ibm_is_subnet.vpc_secure_private_subnet.id
}

output "bastion_floatingip" {
  value = ibm_is_floating_ip.bastion_floatingip.address
}