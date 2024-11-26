output "ipv4_address" {
  value       = digitalocean_droplet.web.ipv4_address
  description = "The public IP address of the website server."
}

output "replica_host" {
  value       = digitalocean_spaces_bucket.web-storage.bucket_domain_name
  description = "The replica storage bucket name."
}
