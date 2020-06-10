data "ibm_is_image" "u18_image" {
  name = var.os_image_name
}

data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}

