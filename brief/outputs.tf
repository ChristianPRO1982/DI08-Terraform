output "vm_public_ip" {
  value = module.vm.public_ip
}

output "storage_account_name" {
  value = module.storage.storage_account_name
}

output "storage_container_name" {
  value = module.storage.container_name
}

output "webapp_default_hostname" {
  value = module.webapp.default_hostname
}
