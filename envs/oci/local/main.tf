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
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
}

############################################
# NETWORK MODULE
############################################

module "network" {
  source = "../../../modules/oci/network"

  network_name     = var.network_name
  compartment_ocid = var.compartment_ocid

  vcn_cidr         = var.vcn_cidr
  subnet_cidr      = var.subnet_cidr
  vcn_dns_label    = var.vcn_dns_label
  subnet_dns_label = var.subnet_dns_label

  app_port = var.app_port
}

############################################
# JENKINS VM
############################################

module "jenkins_vm" {
  source = "../../../modules/oci/compute-runtime"

  instance_name    = var.app_name
  compartment_ocid = var.compartment_ocid

  subnet_id = module.network.subnet_id

  shape            = var.shape
  ocpus            = var.ocpus
  memory_gb        = var.memory_gb
  boot_volume_size = var.boot_volume_size

  ssh_public_key = var.ssh_public_key
  cloud_init_file = var.cloud_init_file
}
