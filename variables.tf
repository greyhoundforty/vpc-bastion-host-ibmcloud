variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Default is us-south."
  type        = string
  default     = "us-south"
}

variable "per_zone_count" {
  description = "Instances to deploy per zone. Default is 3."
  type        = string
  default     = "3"
}

variable "os_image_name" {
  description = "Operating System image of the instance. Default is Ubuntu 18 (ibm-ubuntu-18-04-1-minimal-amd64-1)."
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
  description = "Use the Zone default prefixes (auto) or create your own (manual). Default is manual."
  type        = string
  default     = "auto"
}
