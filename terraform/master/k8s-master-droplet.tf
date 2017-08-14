
resource "digitalocean_droplet" "k8s-master" {
    image  = "27026354"
    name   = "k8s-master"
    region = "nyc3"
    size   = "2gb"
    ssh_keys = ["976907"]

 provisioner "file" {
  source      = "scripts/k8s-master.sh"
  destination = "/tmp/k8s-master.sh"

  connection {
    type     = "ssh"
    user     = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout  = "1m"
  }

}

provisioner "file" {
 source      = "conf"
 destination = "/tmp/conf"

 connection {
   type     = "ssh"
   user     = "root"
   private_key = "${file("~/.ssh/id_rsa")}"
   timeout  = "1m"
 }

}

 provisioner "remote-exec" {
   inline = ["sudo sh /tmp/k8s-master.sh"]

   connection {
     type     = "ssh"
     user     = "root"
     private_key = "${file("~/.ssh/id_rsa")}"
     timeout  = "1m"
   }

 }

}

output "master_ip" {
  value = "${digitalocean_droplet.k8s-master.ipv4_address}"
}
