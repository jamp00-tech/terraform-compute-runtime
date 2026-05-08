############################################
# GENERAL
############################################

variable "network_name" {
  description = "Network base name"
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

############################################
# NETWORK
############################################

variable "vcn_cidr" {
  description = "VCN CIDR block"
  type        = string
}

variable "subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
}

variable "vcn_dns_label" {
  description = "VCN DNS label"
  type        = string
}

variable "subnet_dns_label" {
  description = "Subnet DNS label"
  type        = string
}

############################################
# PORTS
############################################

variable "app_port" {
  description = "Main public application port"
  type        = number
}
