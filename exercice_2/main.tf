terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

resource "local_file" "generated" {
  filename        = var.file_name
  content         = var.file_content
  file_permission = "0644"
}
