resource "digitalocean_droplet" "kubernetes_master" {
  image  = "ubuntu-18-04-x64"
  name   = "kubernetes-master"
  region = var.region
  size   = "s-2vcpu-2gb"
  tags   = [
    "firewall-ssh-only"
  ]
}

resource "digitalocean_volume_attachment" "kubernetes_master" {
  droplet_id = digitalocean_droplet.kubernetes_master.id
  volume_id  = data.digitalocean_volume.kubernetes_master.id
}

resource "digitalocean_droplet" "kubernetes_worker_1" {
  image  = "ubuntu-18-04-x64"
  name   = "kubernetes-worker-1"
  region = var.region
  size   = "s-2vcpu-2gb"
  tags   = [
    "firewall-ssh-only"
  ]
}

resource "digitalocean_volume_attachment" "kubernetes_worker_1" {
  droplet_id = digitalocean_droplet.kubernetes_worker_1.id
  volume_id  = data.digitalocean_volume.kubernetes_worker_1.id
}

resource "digitalocean_droplet" "kubernetes_worker_2" {
  image  = "ubuntu-18-04-x64"
  name   = "kubernetes-worker-2"
  region = var.region
  size   = "s-2vcpu-2gb"
  tags   = [
    "firewall-ssh-only"
  ]
}

resource "digitalocean_volume_attachment" "kubernetes_worker_2" {
  droplet_id = digitalocean_droplet.kubernetes_worker_2.id
  volume_id  = data.digitalocean_volume.kubernetes_worker_2.id
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
