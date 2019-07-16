variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}

variable "deployment_name" { default = "do" }

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_ssh_key" "default" {
  name       = "ed25519mbp"
  public_key = "${file("${var.pub_key}")}"
}

variable "region" {
  description = "Digital Ocean Region"
  default = "nyc1"
}

variable "default_do_size" {
  description = "Droplet Size"
  default = "s-1vcpu-1gb"
}

variable "bsdzfsimage" {
  description = "Droplet Image"
  default = "freebsd-12-x64-zfs"
}
