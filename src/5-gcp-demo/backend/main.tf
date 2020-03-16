provider "google" {
  version = "~> 2.5"
  project = "terraform-project-271020"
  region  = "us-central1"
}

resource "google_storage_bucket" "backend" {
  name     = "ca-demo-tf-state-jl"
  location = "US"
}
