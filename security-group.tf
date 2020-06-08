resource "ibm_is_security_group" "consul_security_group" {
  name = "consul-sg"
  vpc  = ibm_is_vpc.consul_vpc.id
}

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

resource "ibm_is_security_group_rule" "bastion_ssh_access_inbound" {
  depends_on = [ibm_is_security_group.bastion_security_group]
  group      = ibm_is_security_group.bastion_security_group.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  tcp {
    port_min = "22"
    port_max = "22"
  }
}

resource "ibm_is_security_group_rule" "ingress_serf_wan_port_udp" {
  depends_on = [ibm_is_security_group.consul_security_group]
  group      = ibm_is_security_group.consul_security_group.id
  direction  = "inbound"
  remote     = "192.168.0.0/24"
  udp {
    port_min = var.serf_wan_port
    port_max = var.serf_wan_port
  }
}

resource "ibm_is_security_group_rule" "egress_serf_wan_port_udp" {
  depends_on = [ibm_is_security_group.consul_security_group]
  group      = ibm_is_security_group.consul_security_group.id
  direction  = "outbound"
  remote     = "192.168.0.0/24"
  udp {
    port_min = var.serf_wan_port
    port_max = var.serf_wan_port
  }
}

resource "ibm_is_security_group_rule" "egress_server_rpc_port_lan" {
  depends_on = [ibm_is_security_group.consul_security_group]
  group      = ibm_is_security_group.consul_security_group.id
  direction  = "outbound"
  remote     = "192.168.0.0/24"
  tcp {
    port_min = var.server_rpc_port
    port_max = var.server_rpc_port
  }
}

resource "ibm_is_security_group_rule" "ingress_server_rpc_port_lan" {
  depends_on = [ibm_is_security_group.consul_security_group]
  group      = ibm_is_security_group.consul_security_group.id
  direction  = "inbound"
  remote     = "192.168.0.0/24"
  tcp {
    port_min = var.server_rpc_port
    port_max = var.server_rpc_port
  }
}

resource "ibm_is_security_group_rule" "ssh_access" {
  depends_on = [ibm_is_security_group.consul_security_group]
  group      = ibm_is_security_group.consul_security_group.id
  direction  = "inbound"
  remote     = ibm_is_instance.bastion_instance.primary_network_interface[0].primary_ipv4_address
  tcp {
    port_min = "22"
    port_max = "22"
  }
}

