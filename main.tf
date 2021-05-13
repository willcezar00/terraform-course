# Configure the Digital ocean droplet resource
resource "digitalocean_droplet" "web" {
  image    = var.droplet_image
  name     = var.droplet_names[count.index] #create instances names with custom names
  region   = var.datacenter_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys
  tags     = [var.droplet_tag]

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      ssh_keys,
    ]
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      host        = self.ipv4_address #self tag is used to get the droplet reference
      timeout     = "2m"
      private_key = file(var.private_key_path)
    }

    inline = [ # inline commands that will be executed on the host after apply
      "curl -fsSL https://get.docker.com | sh;",
      "docker run -d -p 80:80 nginx"
    ]
  }
  count = length(var.droplet_names)

}






