
resource "digitalocean_droplet" "nmap_scanner" {
  image = "${var.bsdzfsimage}"
  region = "${var.region}"
  name = "${var.deployment_name}-nmap-scanner"
  size = "${var.default_do_size}"
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]

  lifecycle {
    create_before_destroy = true
  }

  provisioner "remote-exec" {
    inline = [
      "pkg install -y python3"
    ]
    connection {
      type = "ssh"
      user = "root"
      host = "${digitalocean_droplet.nmap_scanner.ipv4_address}"
      private_key = "${file(var.pvt_key)}"
    }
  }
  
  provisioner "local-exec" {
    command = "ansible-playbook --ssh-common-args='-o StrictHostKeyChecking=no' -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} scanner.yml"
  }
}
