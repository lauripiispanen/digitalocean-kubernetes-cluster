module "kubernetes_master_1" {
  source = "./droplet"
  name = "kubernetes-master-1"
  volume_id = data.digitalocean_volume.kubernetes_master_1.id
  tags   = [
    "firewall-ssh-only",
    "kubernetes-master"
  ]
}


module "kubernetes_master_2" {
  source = "./droplet"
  name = "kubernetes-master-2"
  volume_id = data.digitalocean_volume.kubernetes_master_2.id
  tags   = [
    "firewall-ssh-only",
    "kubernetes-master"
  ]
}

module "kubernetes_worker_1" {
  source = "./droplet"
  name = "kubernetes-worker-1"
  volume_id = data.digitalocean_volume.kubernetes_worker_1.id
  tags   = [
    "firewall-ssh-only",
    "kubernetes-worker"
  ]
}

module "kubernetes_worker_2" {
  source = "./droplet"
  name = "kubernetes-worker-2"
  volume_id = data.digitalocean_volume.kubernetes_worker_2.id
  tags   = [
    "firewall-ssh-only",
    "kubernetes-worker"
  ]
}

resource "digitalocean_firewall" "ssh-only" {
  name = "ssh-only"

  tags = [
    "firewall-ssh-only"
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = [
      var.current_ip
    ]
  }

}
