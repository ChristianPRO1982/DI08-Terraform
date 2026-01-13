variable "location" {
  type        = string
  description = "Azure region"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used to build resource names"
}

variable "vm_size" {
  type        = string
  description = "Azure VM size"
}

variable "admin_username" {
  type        = string
  description = "Linux VM admin username"
}

variable "admin_ssh_public_key" {
  type        = string
  description = "SSH public key for the admin user"
}
