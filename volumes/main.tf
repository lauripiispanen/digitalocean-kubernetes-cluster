resource "digitalocean_volume" "kubernetes-master" {
  region                  = "fra1"
  name                    = "kubernetes-master"
  size                    = 50
  initial_filesystem_type = "ext4"
  description             = "kubernetes master volume"
}

resource "digitalocean_volume" "kubernetes-worker-1" {
  region                  = "fra1"
  name                    = "kubernetes-worker-1"
  size                    = 50
  initial_filesystem_type = "ext4"
  description             = "kubernetes worker #1 volume"
}

resource "digitalocean_volume" "kubernetes-worker-2" {
  region                  = "fra1"
  name                    = "kubernetes-worker-2"
  size                    = 50
  initial_filesystem_type = "ext4"
  description             = "kubernetes worker #2 volume"
}
