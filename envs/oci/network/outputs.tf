output "vcn_info" {
  value = {
    id   = oci_core_vcn.main.id
    name = oci_core_vcn.main.display_name
    cidr = oci_core_vcn.main.cidr_block
  }
}

output "internet_gateway_info" {
  value = {
    id   = oci_core_internet_gateway.igw.id
    name = oci_core_internet_gateway.igw.display_name
  }
}
