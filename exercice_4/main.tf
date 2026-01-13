terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "random" {}
provider "local" {}

resource "random_password" "passwords" {
  for_each = toset([
    "pwd1",
    "pwd2",
    "pwd3",
    "pwd4",
    "pwd5",
    "pwd6",
    "pwd7",
    "pwd8",
    "pwd9",
    "pwd10"
  ])

  length  = 16
  special = true
}

resource "local_file" "password_file" {
  filename = "passwords.txt"

  content = join(
    "\n",
    [
      for key, pwd in random_password.passwords :
      "${key}: ${pwd.result}"
    ]
  )

  file_permission = "0600"
}
