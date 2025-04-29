provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = var.ssh_key_name
  public_key = var.ssh_public_key
}

resource "digitalocean_droplet" "web" {
  name              = "terraform-droplet"
  region            = var.region
  size              = var.size
  image             = var.image
  ssh_keys          = [digitalocean_ssh_key.default.id]
  backups           = false
  ipv6              = true
  monitoring        = true
}

output "droplet_ip" {
  value = digitalocean_droplet.web.ipv4_address
}
