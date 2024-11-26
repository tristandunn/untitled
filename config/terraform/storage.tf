resource "digitalocean_spaces_bucket" "web-storage" {
  name   = "${var.droplet_name}-web-storage"
  region = var.droplet_region
}
