terraform {
  backend "gcs" {
    bucket = "tf-state-project-b99184b9-88d2-4aab-aa5"
    prefix = "terraform/state"
  }
}
