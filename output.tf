# You can declare an output to be showed when you use the command "output" 
# When use "terraform output" after creating the droplet, you must see the 
# ip_do_droplet and ip_do_loadbalancer values.

output "ip_do_droplet" {
  value = digitalocean_droplet.web[*].ipv4_address
}

output "ip_do_loadbalancer" {
  value = digitalocean_loadbalancer.public.ip
}

output "db_password" {
  value     = digitalocean_database_user.user.password
  sensitive = true
}


output "db_uri" {
  value     = digitalocean_database_cluster.postgres.uri
  sensitive = true
}