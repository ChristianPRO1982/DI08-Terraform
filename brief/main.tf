module "vm" {
  source = "./modules/vm"

  location             = var.location
  name_prefix          = var.name_prefix
  resource_group_name  = var.resource_group_name
  vm_size              = var.vm_size
  admin_username       = var.vm_admin_username
  admin_ssh_public_key = var.vm_admin_ssh_public_key
}

module "storage" {
  source = "./modules/storage"

  location            = var.location
  name_prefix         = var.name_prefix
  resource_group_name = var.resource_group_name
  container_name      = var.storage_container_name
}
