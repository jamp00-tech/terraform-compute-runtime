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
# EXISTING NETWORK
############################################

data "oci_core_vcns" "main" {
  compartment_id = var.compartment_ocid

  filter {
    name   = "display_name"
    values = [var.network_name]
  }
}

data "oci_core_internet_gateways" "main" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.main.virtual_networks[0].id

  filter {
    name   = "display_name"
    values = [var.internet_gateway_name]
  }
}

############################################
# APP SUBNET MAP
############################################

locals {
  subnet_map = {
    dev-host              = "10.10.1.0/24"
    spring-boot-jwt-kafka = "10.10.2.0/24"
    trading-bot           = "10.10.3.0/24"
  }
}

############################################
# APP NETWORK
############################################

resource "oci_core_route_table" "app_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.main.virtual_networks[0].id
  display_name   = "${var.app_name}-route-table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = data.oci_core_internet_gateways.main.gateways[0].id
  }
}

resource "oci_core_security_list" "app_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.main.virtual_networks[0].id
  display_name   = "${var.app_name}-security-list"

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = var.app_port
      max = var.app_port
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}

resource "oci_core_subnet" "app_subnet" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.main.virtual_networks[0].id

  cidr_block   = local.subnet_map[var.app_name]
  display_name = "${var.app_name}-subnet"
  dns_label    = "appsubnet"

  route_table_id    = oci_core_route_table.app_route_table.id
  security_list_ids = [oci_core_security_list.app_security_list.id]

  prohibit_public_ip_on_vnic = false
}

############################################
# VM
############################################

module "dev_vm" {
  source = "../../../modules/oci/compute-runtime"

  instance_name    = var.app_name
  compartment_ocid = var.compartment_ocid

  subnet_id = oci_core_subnet.app_subnet.id

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