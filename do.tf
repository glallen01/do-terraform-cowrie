variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

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
