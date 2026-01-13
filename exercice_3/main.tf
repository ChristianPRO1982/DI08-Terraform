terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "http" {}
provider "local" {}

data "http" "countries_csv" {
  url = "https://cdn.wsform.com/wp-content/uploads/2018/09/country_full.csv"
}

resource "local_file" "downloaded" {
  filename        = "downloaded_file.txt"
  content         = data.http.countries_csv.response_body
  file_permission = "0644"
}
