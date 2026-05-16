############################################
# PROVIDER
############################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.0.0"
    }
  }
}

provider "oci" {
  region       = var.region
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
}

############################################
# NETWORK MODULE
############################################

module "network" {
  source = "../../../modules/oci/network"

  network_name     = var.network_name
  compartment_ocid = var.compartment_ocid
  app_port         = var.app_port
}

############################################
# DEVELOPMENT VM
############################################

module "dev_vm" {
  source = "../../../modules/oci/compute-runtime"

  instance_name    = app_name
  compartment_ocid = var.compartment_ocid

  subnet_id = module.network.subnet_id

  shape            = var.shape
  ocpus            = var.ocpus
  memory_gb        = var.memory_gb
  boot_volume_size = var.boot_volume_size

  ssh_public_key = var.ssh_public_key

  app_name       = var.app_name
  image_tag      = var.image_tag
  ocir_registry  = var.ocir_registry
  ocir_namespace = var.ocir_namespace
  environment    = var.env

  cloud_init_content = templatefile(var.cloud_init_file, {
    app_name                = var.app_name
    image_tag               = var.image_tag
    container_port          = var.app_port
    ocir_registry           = var.ocir_registry
    ocir_namespace          = var.ocir_namespace
    ocir_username_secret_id = var.ocir_username_secret_id
    ocir_token_secret_id    = var.ocir_token_secret_id
  })
}
