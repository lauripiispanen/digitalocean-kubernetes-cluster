data "digitalocean_volume" "kubernetes_master_1" {
  name   = "kubernetes-master-1"
  region = var.region
}

data "digitalocean_volume" "kubernetes_master_2" {
  name   = "kubernetes-master-2"
  region = var.region
}

data "digitalocean_volume" "kubernetes_worker_1" {
  name   = "kubernetes-worker-1"
  region = var.region
}

data "digitalocean_volume" "kubernetes_worker_2" {
  name   = "kubernetes-worker-2"
  region = var.region
}
