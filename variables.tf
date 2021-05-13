variable "token" {
  type        = string
  description = "Token gerado na Digital Ocean por meio da chave SSH"
}

variable "droplet_image" {
  type        = string
  description = "Base image of droplet"
  default     = "ubuntu-18-04-x64"
}

variable "droplet_names" {
  type        = list(string)
  description = "Name of droplet"
  default     = ["web-1", "web-2"]
}

variable "datacenter_region" {
  type        = string
  description = "Region of droplet"
  default     = "nyc3"
}

variable "droplet_size" {
  type        = string
  description = "Size of droplet"
  default     = "s-1vcpu-1gb"
}


variable "droplet_ssh_keys" {
  type        = list(string)
  description = "ssh keys to access Digital Ocean"
  default     = ["78:8b:4e:77:09:63:d4:04:e8:90:9b:35:d2:65:23:d3"]
}

variable "private_key_path" {
  type        = string
  description = "Caminho para chave privada SSH"
  default     = "C:/Users/DTI Digital/.ssh/id_rsa"
}

variable "lb_name" {
  type        = string
  description = "Nome do nosso load balancer"
  default     = "hashicourse"
}

variable "pg_cluster_name" {
  type        = string
  description = "Nome do cluster no postgress"
  default     = "postgres-cluster"
}

variable "pg_cluster_version" {
  type        = string
  description = "Versão do cluster no postgress"
  default     = "12"
}

variable "pg_cluster_size" {
  type        = string
  description = "Tamanho do node do cluster no postgress"
  default     = "db-s-1vcpu-1gb"
}

variable "pg_node_count" {
  type        = number
  description = "Número de nodes do cluster no postgress"
  default     = 1
}

variable "db_name" {
  type        = string
  description = "Nome do banco de dados"
  default     = "terraform-db"
}

variable "db_user" {
  type        = string
  description = "Usuário do banco de dados postgress"
  default     = "will"
  sensitive   = true
}

variable "firewall_name" {
  type        = string
  description = "Nome do firewall"
  default     = "stonewall"
}

variable "droplet_tag" {
  type        = string
  description = "Tag utilizada nos droplets"
  default     = "webserver"
}

variable "troubleshooting"{
  type = bool 
  description = "Liberar acesso aos droplets na porta 22 (ssh)"
  default = false
}