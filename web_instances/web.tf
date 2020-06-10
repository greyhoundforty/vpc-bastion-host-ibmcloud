resource "ibm_is_instance" "web_instances" {
  count   = var.instance_count
  name    = "${module.vpc.name}-web-${count.index + 1}-instance"
  image   = nodule.vpc.default_image
  profile = var.web_image_name

  primary_network_interface {
    subnet          = module.networking_security.private_subnet_id
    security_groups = [module.security.maintenance_sg_id]
  }

  resource_group = module.vpc.resource_group_id
  tags           = ["ryantiffany", var.vpc_name]

  vpc       = module.vpc.vpc_id
  zone      = "${module.vpc.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("web_install.yml")
}