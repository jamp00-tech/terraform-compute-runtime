############################################
# GENERAL
############################################

variable "app_name" {
  description = "Application or machine name"
  type        = string
}

variable "env" {
  description = "Environment name, for example dev, staging or prod"
  type        = string
}

############################################
# OCI AUTH / REGION
############################################

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
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.10.1.0/24"
}

############################################
# COMPUTE
############################################

variable "shape" {
  description = "OCI compute shape"
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "ocpus" {
  description = "Number of OCPUs"
  type        = number
  default     = 1
}

variable "memory_gb" {
  description = "Memory in GB"
  type        = number
  default     = 4
}

variable "boot_volume_size" {
  description = "Boot volume size in GB"
  type        = number
  default     = 50
}

############################################
# ACCESS
############################################

variable "ssh_public_key" {
  description = "Public SSH key for VM access"
  type        = string
}

############################################
# CLOUD INIT
############################################

variable "cloud_init_file" {
  description = "Path to cloud-init file"
  type        = string
}

############################################
# APPLICATION
############################################

variable "app_port" {
  description = "Public port exposed by the application"
  type        = number
  default     = 8080
}
