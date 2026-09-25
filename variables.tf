/* Common variables */
variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
  default     = "project-b99184b9-88d2-4aab-aa5"
}

variable "region" {
  description = "Region to place compute resources at."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to place compute resource at."
  type        = string
  default     = "us-central1-c"
}

variable "network" {
  description = "Network to create compute resources in."
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnet to create compute resources in."
  type        = string
  default     = "default"
}

variable "machine_type" {
  description = "Machine type for GCE instance."
  type        = string
  default     = "e2-standard-2"
}

variable "machine_name" {
  description = "Compute Instance name."
  type        = string
  default     = "test-vm"
}

variable "tf_state_bucket_name" {
  description = "Globally unique GCS bucket name for Terraform remote state."
  type        = string
  default     = "tf-state-project-b99184b9-88d2-4aab-aa5"
}

variable "bq_dataset_id" {
  description = "BigQuery dataset ID."
  type        = string
  default     = "demo_dataset"
}

variable "bq_table_id" {
  description = "BigQuery table ID."
  type        = string
  default     = "simple_3x3"
}