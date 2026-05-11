############################################
# GENERAL
############################################

variable "instance_name" {
  description = "Compute instance base name"
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID"
  type        = string
}

############################################
# NETWORK
############################################

variable "subnet_id" {
  description = "OCI subnet OCID where the VM will be created"
  type        = string
}

############################################
# COMPUTE
############################################

variable "shape" {
  description = "OCI compute shape"
  type        = string
}

variable "ocpus" {
  description = "Number of OCPUs"
  type        = number
}

variable "memory_gb" {
  description = "Memory in GB"
  type        = number
}

variable "boot_volume_size" {
  description = "Boot volume size in GB"
  type        = number
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

variable "cloud_init_content" {
  description = "Rendered cloud-init content"
  type        = string
}