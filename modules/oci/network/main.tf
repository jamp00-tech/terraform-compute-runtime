############################################
# EXISTING VCN
############################################
data "oci_core_vcns" "shared" {
  compartment_id = var.compartment_ocid

  filter {
    name   = "display_name"
    values = ["${var.network_name}-vcn"]
  }
}

############################################
# EXISTING INTERNET GATEWAY
############################################
data "oci_core_internet_gateways" "shared" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.shared.virtual_networks[0].id

  filter {
    name   = "display_name"
    values = ["${var.network_name}-igw"]
  }
}

############################################
# ROUTE TABLE
############################################
resource "oci_core_route_table" "public_rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.shared.virtual_networks[0].id
  display_name   = "${var.app_name}-public-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = data.oci_core_internet_gateways.shared.gateways[0].id
  }
}

############################################
# SECURITY LIST
############################################
resource "oci_core_security_list" "public_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = data.oci_core_vcns.shared.virtual_networks[0].id
  display_name   = "${var.app_name}-public-sl"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

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
}

############################################
# PUBLIC SUBNET
############################################
resource "oci_core_subnet" "public_subnet" {
  cidr_block                 = var.subnet_cidr_block
  compartment_id             = var.compartment_ocid
  vcn_id                     = data.oci_core_vcns.shared.virtual_networks[0].id
  display_name               = "${var.app_name}-public-subnet"
  dns_label                  = var.subnet_dns_label
  route_table_id             = oci_core_route_table.public_rt.id
  security_list_ids          = [oci_core_security_list.public_sl.id]
  prohibit_public_ip_on_vnic = false
}
