variable "vpc_name" {
  description = "Name of the VPC to create."
  type        = string
  default     = "moduletest"
}

variable "resource_group_name" {
  description = "The Resource group that resources will get provisioned in to."
  type        = string
  default     = "default"
}

variable "ssh_key_name" {
  description = "Name of SSH key already added to VPC."
  type        = string
  default     = ""
}

variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = "us-south"
}