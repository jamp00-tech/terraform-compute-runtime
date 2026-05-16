############################################
# VCN
############################################

resource "oci_core_vcn" "main" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name   = "${var.env}-vcn"
  dns_label      = "dns-${var.env}-vcn"
}

############################################
# INTERNET GATEWAY
############################################

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.env}-igw"
  enabled        = true
}
