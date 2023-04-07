terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


resource "yandex_mdb_mysql_database" "db" {
  cluster_id = var.cluster_id
  name       = var.db_name
}

resource "yandex_mdb_mysql_user" "user" {
  cluster_id = var.cluster_id
  name       = var.user_name
  password   = var.pswd
  permission {
    database_name = var.db_name
    roles         = ["ALL"]
  }
}