resource "digitalocean_database_cluster" "postgres" {
  name       = var.pg_cluster_name
  engine     = "pg"
  version    = var.pg_cluster_version
  size       = var.pg_cluster_size
  region     = var.datacenter_region
  node_count = 1
}

resource "digitalocean_database_db" "database-example" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = var.db_name
}

resource "digitalocean_database_user" "user" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = var.db_user
}
