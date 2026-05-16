############################################
# OUTPUTS (desde el módulo)
############################################

output "instance_id" {
  description = "OCI instance OCID"
  value       = module.dev_vm.instance_id
}

output "instance_name" {
  description = "Instance name"
  value       = module.dev_vm.instance_name
}

output "public_ip" {
  description = "Public IP of the VM"
  value       = module.dev_vm.public_ip
}

output "private_ip" {
  description = "Private IP of the VM"
  value       = module.dev_vm.private_ip
}
