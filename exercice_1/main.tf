terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

resource "local_file" "hello_world" {
  filename        = "hello_world.txt"
  content         = "Bienvenue dans Terraform !"
}