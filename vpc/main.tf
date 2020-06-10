resource "ibm_is_vpc" "default_rt_vpc" {
  name           = var.vpc_name
  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.region, var.vpc_name]
}