output "maintenance_sg_id" {
    value = ibm_is_security_group.vpc_secure_maintenance_sg.id
}

output "bastion_sg_id" {
    value = ibm_is_security_group.vpc_secure_bastion_sg.id
}