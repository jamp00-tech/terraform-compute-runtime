############################################
# COMPUTE OUTPUTS
############################################

output "instance_id" {
  description = "OCI compute instance OCID"
  value       = oci_core_instance.vm.id
}

output "instance_name" {
  description = "OCI compute instance display name"
  value       = oci_core_instance.vm.display_name
}

output "public_ip" {
  description = "Public IP address of the compute instance"
  value       = oci_core_instance.vm.public_ip
}

output "private_ip" {
  description = "Private IP address of the compute instance"
  value       = oci_core_instance.vm.private_ip
}

############################################
# NETWORK OUTPUTS
############################################

output "vcn_id" {
  description = "OCI VCN OCID"
  value       = oci_core_vcn.main.id
}

output "subnet_id" {
  description = "OCI public subnet OCID"
  value       = oci_core_subnet.public_subnet.id
}

############################################
# ACCESS OUTPUTS
############################################

output "ssh_command" {
  description = "SSH command to access the VM"
  value       = "ssh opc@${oci_core_instance.vm.public_ip}"
}

output "app_url" {
  description = "Application URL"
  value       = "http://${oci_core_instance.vm.public_ip}:${var.app_port}"
}
