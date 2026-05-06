############################################
# PROVIDER
############################################

provider "oci" {
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
}

############################################
# MODULE CALL
############################################

module "compute_runtime" {
  source = "../../../modules/oci/compute-runtime"

  ##########################################
  # GENERAL
  ##########################################
  app_name = var.app_name
  env      = var.env

  ##########################################
  # OCI
  ##########################################
  compartment_ocid = var.compartment_ocid

  ##########################################
  # NETWORK
  ##########################################
  vcn_cidr    = var.vcn_cidr
  subnet_cidr = var.subnet_cidr

  ##########################################
  # COMPUTE
  ##########################################
  shape             = var.shape
  ocpus             = var.ocpus
  memory_gb         = var.memory_gb
  boot_volume_size  = var.boot_volume_size

  ##########################################
  # ACCESS
  ##########################################
  ssh_public_key = var.ssh_public_key

  ##########################################
  # CLOUD INIT
  ##########################################
  cloud_init_file = var.cloud_init_file

  ##########################################
  # APP
  ##########################################
  app_port = var.app_port
}

############################################
# OUTPUTS (propagación)
############################################

output "public_ip" {
  value = module.compute_runtime.public_ip
}

output "app_url" {
  value = module.compute_runtime.app_url
}
