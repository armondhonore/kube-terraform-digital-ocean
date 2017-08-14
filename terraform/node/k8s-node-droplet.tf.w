
resource "digitalocean_droplet" "k8s-node" {
    count = 2
    image  = "27026354"
    name   = "k8s-node-${count.index}"
    region = "nyc3"
    size   = "2gb"
    ssh_keys = ["976907"]

 provisioner "file" {
  source      = "scripts/k8s-node.sh"
  destination = "/tmp/k8s-node.sh"

  connection {
    type     = "ssh"
    user     = "root"
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout  = "1m"
  }

}

 provisioner "remote-exec" {
   inline = ["sudo sh /tmp/k8s-node.sh"]

   connection {
     type     = "ssh"
     user     = "root"
     private_key = "${file("~/.ssh/id_rsa")}"
     timeout  = "1m"
   }

 }

}
