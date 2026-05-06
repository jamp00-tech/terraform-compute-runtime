############################################
# OCI AUTH / PROVIDER
############################################

variable "region" {
  description = "OCI region"
  type        = string
}

variable "tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "user_ocid" {
  description = "OCI user OCID"
  type        = string
}

variable "fingerprint" {
  description = "OCI API key fingerprint"
  type        = string
}

variable "private_key_path" {
  description = "Path to OCI private key"
  type        = string
}

############################################
# GENERAL
############################################

variable "app_name" {
  description = "Application or machine name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

############################################
# OCI INFRA
############################################

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

############################################
# NETWORK
############################################

variable "vcn_cidr" {
  description = "VCN CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
  default     = "10.10.1.0/24"
}

############################################
# COMPUTE
############################################

variable "shape" {
  description = "Instance shape"
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "ocpus" {
  description = "Number of CPUs"
  type        = number
  default     = 1
}

variable "memory_gb" {
  description = "Memory in GB"
  type        = number
  default     = 4
}

variable "boot_volume_size" {
  description = "Boot volume size"
  type        = number
  default     = 50
}

############################################
# ACCESS
############################################

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}

############################################
# CLOUD INIT
############################################

variable "cloud_init_file" {
  description = "Cloud-init file path"
  type        = string
}

############################################
# APPLICATION
############################################

variable "app_port" {
  description = "Application port"
  type        = number
  default     = 8080
}
