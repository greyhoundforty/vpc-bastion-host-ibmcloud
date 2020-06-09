variable "vpc_name" {
  description = "Name of the VPC to create."
  type        = string
  default     = "v1"
}

variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = "us-south"
}

variable "instance_count" {
  description = "Instances to deploy per zone. Default is 3."
  type        = string
  default     = "3"
}

variable "os_image_name" {
  description = "Operating System image of the instance. Default is Ubuntu 18."
  type        = string
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}

variable "instance_profile" {
  description = "Flavor size of the instance. Default is bx2-4x16."
  type        = string
  default     = "bx2-4x16"
}

variable "domain" {
  description = "Domain name for instance. Default is cdetesting.com"
  type        = string
  default     = "cdetesting.com"
}

variable "resource_group_name" {
  description = "The Resource group that resources will get provisioned in to."
  type        = string
  default     = ""
}

variable "ssh_key_name" {
  description = "Name of SSH key already added to VPC."
  type        = string
  default     = ""
}