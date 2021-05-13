# Providers are plugins that are used to configure a host.
# Configure the DigitalOcean Provider
# documentation https://www.terraform.io/docs/language/providers/index.html

provider "digitalocean" {
  token = var.token
}