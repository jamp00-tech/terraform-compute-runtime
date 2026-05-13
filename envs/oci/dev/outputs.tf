############################################
# OUTPUTS (desde el módulo)
############################################

output "instance_id" {
  description = "OCI instance OCID"
  value       = module.dev_vm[var.app_name].instance_id
}

output "instance_name" {
  description = "Instance name"
  value       = module.dev_vm[var.app_name].instance_name
}

output "public_ip" {
  description = "Public IP of the VM"
  value       = module.dev_vm[var.app_name].public_ip
}

output "private_ip" {
  description = "Private IP of the VM"
  value       = module.dev_vm[var.app_name].private_ip
}
