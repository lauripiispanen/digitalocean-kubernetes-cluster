variable "region" {
  type = string
  default = "fra1"
}

variable "image" {
  type = string
  default = "ubuntu-18-04-x64"
}

variable "size" {
  type = string
  default = "s-2vcpu-2gb"
}

variable "tags" {
  type = list(string)
  default = []
}

variable "name" {
  type = string
}

variable "volume_id" {
  type = string
}

resource "digitalocean_droplet" "droplet" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.size
  tags   = var.tags 
}

resource "digitalocean_volume_attachment" "volume_attachment" {
  droplet_id = digitalocean_droplet.droplet.id
  volume_id  = var.volume_id
}

output "droplet" {
  value = digitalocean_droplet.droplet
}

output "volume_attachment" {
  value = digitalocean_volume_attachment.volume_attachment
}
