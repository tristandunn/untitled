variable "droplet_name" {
  type    = string
  default = "untitled"
}

variable "droplet_image" {
  type    = string
  default = "ubuntu-24-10-x64"
}

variable "droplet_region" {
  type    = string
  default = "nyc3"
}

variable "droplet_size" {
  type    = string
  default = "s-1vcpu-2gb"
}
