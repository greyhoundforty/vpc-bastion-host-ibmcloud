resource "ibm_is_instance" "bastion_instance" {
  name    = "${module.vpc.name}-bastion"
  image   = data.ibm_is_image.bastion_image.id
  profile = var.instance_profile

  primary_network_interface {
    subnet          = module.networking_security.bastion_subnet_id
    security_groups = [module.security.bastion_sg_id]
  }

  resource_group = module.vpc.resource_group_id
  tags           = ["ryantiffany", module.vpc.name, module.vpc.region]

  vpc       = module.vpc.vpc_id
  zone      = "${module.vpc.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("bastion_install.yml")
}

resource "ibm_is_floating_ip" "bastion_floatingip" {
  name   = "${module.vpc.name}-z1-bastion-fip"
  target = ibm_is_instance.bastion_instance.primary_network_interface[0].id
}