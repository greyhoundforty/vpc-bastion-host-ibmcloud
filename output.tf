output "bastion_floating_ip" {
  value = ibm_is_floating_ip.bastion_floatingip.address
}

output "vpc_id" {
  value = ibm_is_vpc.consul_vpc.id
}