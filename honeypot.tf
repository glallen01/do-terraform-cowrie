variable "honeyimage" {
  description = "Droplet Image"
  default = "freebsd-12-x64-zfs"
}

variable "honeysize" {
  description = "Droplet Size"
  default = "s-1vcpu-1gb"
}

resource "digitalocean_droplet" "bsdhoney" {
  image = "${var.honeyimage}"
  region = "${var.region}"
  name = "${var.deployment_name}-bsdhoney"
  size = "${var.honeysize}"
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]

  lifecycle {
    create_before_destroy = false
  }

  provisioner "remote-exec" {
    inline = [
      "pkg install -y python3",
      "ls /usr/local/bin/python3"
    ]
    connection {
      type = "ssh"
      user = "root"
      host = "${digitalocean_droplet.bsdhoney.ipv4_address}"
      private_key = "${file(var.pvt_key)}"
    }
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} honeypot.yml"
  }
}
