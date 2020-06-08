resource "ibm_is_public_gateway" "z1_gateway" {
  name           = "z1-bastion-pubgw"
  vpc            = ibm_is_vpc.default_rt_vpc.id
  zone           = "${var.region}-1"
  resource_group = data.ibm_resource_group.cde_resource_group.id
  tags           = ["ryantiffany"]
}

resource "ibm_is_subnet" "z1_bastion_subnet" {
  resource_group  = data.ibm_resource_group.cde_resource_group.id
  name            = "vpc-secure-bastion-subnet"
  vpc             = ibm_is_vpc.default_rt_vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.0.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

resource "ibm_is_floating_ip" "bastion_floatingip" {
  name   = "z1-bastion-${var.vpc_name}-fip"
  target = ibm_is_instance.bastion_instance.primary_network_interface[0].id
}

resource "ibm_is_subnet" "z1_private_subnet" {
  resource_group  = data.ibm_resource_group.cde_resource_group.id
  name            = "vpc-secure-private-subnet"
  vpc             = ibm_is_vpc.default_rt_vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.1.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

