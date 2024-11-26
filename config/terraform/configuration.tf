data "cloudinit_config" "configuration" {
  gzip          = false
  base64_encode = false

  part {
    content      = templatefile("${path.module}/cloudinit/base.yml.tpl", {})
    content_type = "text/cloud-config"
  }
}
