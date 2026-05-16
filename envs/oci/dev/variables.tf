variable "cloud_init_file" {
  type = string
}

variable "container_port" {
  type = number
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

variable "region" {
  type = string
}

variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key" {
  type      = string
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}

variable "app_name" {
  type = string
}

variable "app_port" {
  type = number
}

variable "image_tag" {
  type = string
}

variable "env" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "network_name" {
  type = string
}

variable "internet_gateway_name" {
  type = string
}

variable "app_subnet_cidr" {
  type = string
}

variable "shape" {
  type = string
}

variable "ocpus" {
  type = number
}

variable "memory_gb" {
  type = number
}

variable "boot_volume_size" {
  type = number
}
