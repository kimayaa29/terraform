provider "aws" {
  region = "ap-south-1"
}

provider "google" {
  credentials = "${file("../account.json")}"
  project = "devops-eng"
  region = "us-east1"
}