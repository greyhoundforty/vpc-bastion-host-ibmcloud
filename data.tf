data "ibm_resource_group" "cde_resource_group" {
  name = "CDE"
}

data "ibm_is_image" "u18_image" {
  name = var.os_image_name
}

data "ibm_is_ssh_key" "us_south__tycho_key" {
  name = "tycho-ng"
}