resource "digitalocean_droplet" "web" {
  name   = var.droplet_name
  image  = var.droplet_image
  region = var.droplet_region
  size   = var.droplet_size

  connection {
    host    = self.ipv4_address
    user    = "root"
    type    = "ssh"
    timeout = "2m"
  }

  user_data = data.cloudinit_config.configuration.rendered
}
