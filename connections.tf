provider "aws" {
  region = var.region
}

provider "google" {
  credentials = "${file("../account.json")}"
  project = "devops-eng"
  region = "us-east1"
}