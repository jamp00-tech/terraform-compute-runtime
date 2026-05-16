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

variable "subnet_name" {
  description = "Existing public subnet name"
  type        = string
}

variable "internet_gateway_name" {
  description = "Existing internet gateway display name"
  type        = string
}

variable "app_subnet_cidr" {
  description = "CIDR block for the application subnet"
  type        = string
}

############################################
# COMPUTE
############################################

variable "shape" {
  description = "Instance shape"
  type        = string
}

variable "ocpus" {
  description = "Number of CPUs"
  type        = number
}

variable "memory_gb" {
  description = "Memory in GB"
  type        = number
}

variable "boot_volume_size" {
  description = "Boot volume size"
  type        = number
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

variable "container_port" {
  description = "Docker port to deploy"
  type        = string
}

variable "ocir_registry" {
  type = string
}

variable "ocir_namespace" {
  type = string
}

variable "ocir_username_secret_id" {
  type = string
}

variable "ocir_token_secret_id" {
  type = string
}

variable "private_key" {
  description = "OCI API private key content"
  type        = string
  sensitive   = true
}

variable "image_tag" {
  type = string
}


############################################
# APPLICATION
############################################

variable "app_port" {
  description = "Application port"
  type        = number
}

############################################
# NETWORK
############################################

variable "network_name" {
  type = string
}
