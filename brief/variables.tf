variable "location" {
  type        = string
  description = "Azure region"
  default     = "westeurope"
}

variable "name_prefix" {
  type        = string
  description = "Prefix used to build resource names"
  default     = "datacorp-brief"
}

variable "vm_size" {
  type        = string
  description = "Azure VM size"
  default     = "Standard_B1s"
}

variable "vm_admin_username" {
  type        = string
  description = "Admin username for the Linux VM"
  default     = "azureuser"
}

variable "vm_admin_ssh_public_key" {
  type        = string
  description = "SSH public key used to connect to the VM"
}
