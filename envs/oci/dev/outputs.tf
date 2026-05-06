############################################
# OUTPUTS (desde el módulo)
############################################

output "instance_id" {
  description = "OCI instance OCID"
  value       = module.compute_runtime.instance_id
}

output "instance_name" {
  description = "Instance name"
  value       = module.compute_runtime.instance_name
}

output "public_ip" {
  description = "Public IP of the VM"
  value       = module.compute_runtime.public_ip
}

output "private_ip" {
  description = "Private IP of the VM"
  value       = module.compute_runtime.private_ip
}

############################################
# ACCESS
############################################

output "ssh_command" {
  description = "SSH command"
  value       = module.compute_runtime.ssh_command
}

output "app_url" {
  description = "Application URL"
  value       = module.compute_runtime.app_url
}
