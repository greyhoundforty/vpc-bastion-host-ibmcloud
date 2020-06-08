resource "ibm_is_security_group" "bastion_security_group" {
  name = "vpc-secure-bastion-sg"
  vpc  = ibm_is_vpc.consul_vpc.id
}

resource "ibm_is_security_group_rule" "bastion_security_group_rule_icmp" {
  group     = ibm_is_security_group.testacc_security_group.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  icmp {
    code = ""
    type = 8
  }

}

resource "ibm_is_security_group_rule" "bastion_security_group_rule_ssh_inbound" {
  depends_on = [ibm_is_security_group.bastion_security_group]
  group      = ibm_is_security_group.bastion_security_group.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = "22"
    port_max = "22"
  }
}



