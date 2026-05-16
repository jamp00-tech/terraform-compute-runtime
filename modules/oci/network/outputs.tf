output "vcn_info" {
  description = "VCN used by this deploy"

  value = {
    id   = data.oci_core_vcns.shared.virtual_networks[0].id
    name = data.oci_core_vcns.shared.virtual_networks[0].display_name
    cidr = data.oci_core_vcns.shared.virtual_networks[0].cidr_block
  }
}

output "subnet_info" {
  description = "Subnet created for this app"

  value = {
    id   = oci_core_subnet.public_subnet.id
    name = oci_core_subnet.public_subnet.display_name
    cidr = oci_core_subnet.public_subnet.cidr_block
  }
}

output "security_list_info" {
  description = "Security list created for this app"

  value = {
    id   = oci_core_security_list.public_sl.id
    name = oci_core_security_list.public_sl.display_name
  }
}

output "internet_gateway_info" {
  description = "Internet Gateway used by this deploy"

  value = {
    id   = data.oci_core_internet_gateways.shared.gateways[0].id
    name = data.oci_core_internet_gateways.shared.gateways[0].display_name
  }
}
