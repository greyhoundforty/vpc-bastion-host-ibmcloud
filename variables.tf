variable "vpc_name" {
  description = "Name of the VPC to create."
  type        = string
  default     = ""
}

variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = "us-south"
}

variable "instance_count" {
  description = "Instances to deploy per zone. Default is 1."
  type        = string
  default     = "1"
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

variable "use_default_prefixes" {
  description = "Use the Zone default prefixes (auto) or create your own (manual). Default is auto."
  type        = string
  default     = "auto"
}

