data "ibm_resource_group" "default" {
  type = string
  name = var.resource_group_name
}

data "ibm_is_image" "u18_image" {
  name = var.os_image_name
}

data "ibm_is_ssh_key" "ssh_key" {
  name = var.name
}