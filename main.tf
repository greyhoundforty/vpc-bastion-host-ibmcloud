resource "ibm_is_vpc" "default_rt_vpc" {
  name                      = var.vpc_name
  resource_group            = data.ibm_resource_group.cde_resource_group.id
  address_prefix_management = var.use_default_prefixes
  tags                      = ["ryantiffany", var.region]
}

resource "ibm_is_instance" "bastion_instance" {
  name    = "bastion-${var.vpc_name}"
  image   = data.ibm_is_image.u18_image.id
  profile = var.instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.z1_bastion_subnet.id
    security_groups = [ibm_is_security_group.vpc_secure_bastion_sg.id]
  }

  resource_group = data.ibm_resource_group.cde_resource_group.id
  tags           = [random_id.vpc_name.hex, "ryantiffany"]

  vpc  = ibm_is_vpc.consul_vpc.id
  zone = "${var.region}-1"
  keys = [data.ibm_is_ssh_key.us_south_tycho_key.id]
}
