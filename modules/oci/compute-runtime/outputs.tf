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

output "ssh_command" {
  description = "SSH command to access the VM"
  value       = "ssh opc@${oci_core_instance.vm.public_ip}"
}