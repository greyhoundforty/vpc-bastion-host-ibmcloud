resource "ibm_is_security_group" "vpc_secure_bastion_sg" {
  name = "vpc-secure-bastion-sg"
  vpc  = ibm_is_vpc.default_rt_vpc.id
}

resource "ibm_is_security_group_rule" "vpc_secure_bastion_sg_icmp" {
  depends_on = [ibm_is_security_group.vpc_secure_bastion_sg]
  group      = ibm_is_security_group.vpc_secure_bastion_sg.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  icmp {
    type = 8
  }
}

resource "ibm_is_security_group_rule" "vpc_secure_bastion_sg_ssh_inbound" {
  depends_on = [ibm_is_security_group.vpc_secure_bastion_sg]
  group      = ibm_is_security_group.vpc_secure_bastion_sg.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = "22"
    port_max = "22"
  }
}

resource "ibm_is_security_group" "vpc_secure_maintenance_sg" {
  name = "vpc-secure-maintenance-sg"
  vpc  = ibm_is_vpc.default_rt_vpc.id
}


