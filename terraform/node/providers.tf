# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
default ="TO_DEBUG_ADD_DO_TOKEN_HERE"
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}
