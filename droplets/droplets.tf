module "kubernetes_master" {
  source = "./droplet"
  name = "kubernetes-master"
  volume_id = data.digitalocean_volume.kubernetes_master.id
  tags   = [
    "firewall-ssh-only"
  ]
}

module "kubernetes_worker_1" {
  source = "./droplet"
  name = "kubernetes-worker-1"
  volume_id = data.digitalocean_volume.kubernetes_worker_1.id
  tags   = [
    "firewall-ssh-only"
  ]
}

module "kubernetes_worker_2" {
  source = "./droplet"
  name = "kubernetes-worker-2"
  volume_id = data.digitalocean_volume.kubernetes_worker_2.id
  tags   = [
    "firewall-ssh-only"
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
