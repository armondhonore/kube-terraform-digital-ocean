# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
default ="6897972000dd8987801eabf70e599b974049dc78d5c0b31d620b67dccf461f85"
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}
