terraform {
  backend "gcs" {
    bucket = "ca-demo-tf-state-jl"
    prefix = "terraform/state"
  }
}

provider "google" {
  version = "~> 2.5"
  project = "terraform-project-271020"
  region  = "${var.region}"
}

provider "kubernetes" {
  version = "~> 1.6"

  host     = "${google_container_cluster.primary.endpoint}"
  username = "${google_container_cluster.primary.master_auth.0.username}"
  password = "${google_container_cluster.primary.master_auth.0.password}"

  client_certificate     = "${base64decode(google_container_cluster.primary.master_auth.0.client_certificate)}"
  client_key             = "${base64decode(google_container_cluster.primary.master_auth.0.client_key)}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)}"
}
