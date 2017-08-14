
resource "digitalocean_droplet" "jenkins" {
    image  = "27005358"
    name   = "jenkins"
    region = "nyc3"
    size   = "1gb"
    ssh_keys = ["976907"]
}
