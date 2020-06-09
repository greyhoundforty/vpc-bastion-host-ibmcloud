resource "ibm_is_vpc" "default_rt_vpc" {
  name           = var.vpc_name
  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.region, var.vpc_name]
}

resource "ibm_is_instance" "bastion_instance" {
  name    = "${var.vpc_name}-bastion"
  image   = data.ibm_is_image.u18_image.id
  profile = var.instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.vpc_secure_bastion_subnet.id
    security_groups = [ibm_is_security_group.vpc_secure_bastion_sg.id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name]

  vpc       = ibm_is_vpc.default_rt_vpc.id
  zone      = "${var.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("basic_install.yml")
}

resource "ibm_is_instance" "web_instances" {
  count   = var.instance_count
  name    = "${var.vpc_name}-web-${count.index + 1}-instance"
  image   = data.ibm_is_image.u18_image.id
  profile = var.instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.vpc_secure_private_subnet.id
    security_groups = [ibm_is_security_group.vpc_secure_maintenance_sg.id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name]

  vpc       = ibm_is_vpc.default_rt_vpc.id
  zone      = "${var.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("web_install.yml")
}

# module "web-instances" {
#   source = "./web-instances"
# }