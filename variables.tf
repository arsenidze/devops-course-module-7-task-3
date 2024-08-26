variable "github_owner" {
  type        = string
  description = "The GitHub owner"
}

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
}

variable "flux_repository_name" {
  type        = string
  description = "GitHub repository"
}

variable "algorithm" {
  type        = string
  default     = "ECDSA"
  description = "The cryptographic algorithm (e.g. RSA, ECDSA)"
}

variable "google_project" {
  type        = string
  description = "GCP project name"
}

variable "google_region" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region to use"
}

variable "gke_num_nodes" {
  type        = number
  description = "GKE nodes number"
}
