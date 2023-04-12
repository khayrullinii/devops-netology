terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_mdb_mysql_cluster" "mysql" {
  name                = var.name
  environment         = "PRODUCTION"
  network_id          = var.network_id
  version             = "8.0"

  resources {
    resource_preset_id = "s3-c2-m8"
    disk_type_id       = "network-hdd"
    disk_size          = "10"
  }
  
  host {
    zone      = var.zone
    subnet_id = var.subnet_id
  }
}

output "cluster_id" {
    value = yandex_mdb_mysql_cluster.mysql
}