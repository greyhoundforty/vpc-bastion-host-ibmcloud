resource "ibm_is_public_gateway" "z1_gateway" {
  name           = "${var.vpc_name}-z1-pubgw"
  resource_group = data.ibm_resource_group.default.id
  vpc            = ibm_is_vpc.default_rt_vpc.id
  zone           = "${var.region}-1"
  tags           = ["ryantiffany", var.vpc_name]
}

resource "ibm_is_subnet" "vpc_secure_bastion_subnet" {
  name            = "${var.vpc_name}-z1-secure-bastion-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = ibm_is_vpc.default_rt_vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.0.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

resource "ibm_is_floating_ip" "bastion_floatingip" {
  name   = "${var.vpc_name}-z1-bastion-fip"
  target = ibm_is_instance.bastion_instance.primary_network_interface[0].id
}

resource "ibm_is_subnet" "vpc_secure_private_subnet" {
  name            = "${var.vpc_name}-z1-secure-private-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = ibm_is_vpc.default_rt_vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.1.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}




