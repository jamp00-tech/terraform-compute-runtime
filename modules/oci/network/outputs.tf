output "vcn_id" {
  description = "VCN OCID"
  value       = oci_core_vcn.main.id
}

output "subnet_id" {
  description = "Public subnet OCID"
  value       = oci_core_subnet.public_subnet.id
}

output "security_list_id" {
  description = "Security list OCID"
  value       = oci_core_security_list.public_sl.id
}

output "internet_gateway_id" {
  description = "Internet gateway OCID"
  value       = oci_core_internet_gateway.igw.id
}