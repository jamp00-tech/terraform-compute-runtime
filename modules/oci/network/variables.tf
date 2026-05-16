############################################
# GENERAL
############################################

variable "network_name" {
  description = "Network base name"
  type        = string
  default     = "oci-project"
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

############################################
# PORTS
############################################

variable "app_port" {
  description = "Main public application port"
  type        = number
}


variable "app_name" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}

variable "subnet_dns_label" {
  type = string
}