variable "web_image_name" {
    type = string
    description = "Default OS Image for Bastion Host."
    default = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}

variable "instance_profile" {
    type = string
    description = "Default machine type/size."
    default = "cx2-2x4"
}

variable "domain" {
  description = "Domain name for instance. Default is cdetesting.com"
  type        = string
  default     = "cdetesting.com"
}

variable "ssh_key_name" {
  description = "Name of SSH key already added to VPC."
  type        = string
  default     = ""
}