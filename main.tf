module "tls_private_key" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"

  algorithm   = var.algorithm
}

module "github_repository" {
  source                   = "./modules/tf-github-repository"
  github_owner             = var.github_owner
  github_token             = var.github_token
  repository_name          = var.flux_repository_name
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux"
  default_branch_name      = "main"
}

module "gke_cluster" {
  source = "github.com/den-vasyliev/tf-google-gke-cluster"
  GOOGLE_REGION = var.google_region
  GOOGLE_PROJECT = var.google_project
  GKE_NUM_NODES = var.gke_num_nodes
}

module "flux_bootstrap" {
  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.github_owner}/${var.flux_repository_name}"
  private_key       = module.tls_private_key.private_key_pem
  config_path       = module.kind_cluster.kubeconfig
  github_token      = var.github_token
}
