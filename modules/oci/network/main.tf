############################################
# VCN (Virtual Cloud Network)
############################################

resource "oci_core_vcn" "main" {
  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "${var.network_name}-vcn"
  dns_label      = var.vcn_dns_label
}

############################################
# INTERNET GATEWAY
############################################

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.network_name}-igw"
  enabled        = true
}

############################################
# ROUTE TABLE
############################################

resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.network_name}-public-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

############################################
# SECURITY LIST
############################################

resource "oci_core_security_list" "public_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.main.id
  display_name   = "${var.network_name}-public-sl"

  # Outbound traffic
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  # SSH
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  # Application / Jenkins HTTP port
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = var.app_port
      max = var.app_port
    }
  }
}

############################################
# PUBLIC SUBNET
############################################

resource "oci_core_subnet" "public_subnet" {
  cidr_block                 = var.subnet_cidr
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.main.id
  display_name               = "${var.network_name}-public-subnet"
  dns_label                  = var.subnet_dns_label
  route_table_id             = oci_core_route_table.public_rt.id
  security_list_ids          = [oci_core_security_list.public_sl.id]
  prohibit_public_ip_on_vnic = false
}
