resource "yandex_vpc_network" "netology" {
name = "netology"
}

resource "yandex_vpc_subnet" "netology" {
  name           = var.vpc_name_private
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "netology1" {
  name           = "private1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

resource "yandex_vpc_subnet" "netology2" {
  name           = "private2"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = ["192.168.30.0/24"]
}

resource "yandex_mdb_mysql_cluster" "netology" {
  name        = "netology"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.netology.id
  version     = "8.0"
  deletion_protection = true

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 120
  }

  backup_window_start {
    hours = 23
    minutes = 59
  }

  maintenance_window {
    type = "ANYTIME"
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.netology.id
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.netology1.id
  }

  host {
    zone      = "ru-central1-c"
    subnet_id = yandex_vpc_subnet.netology2.id
  }
}

resource "yandex_mdb_mysql_database" "netology_db" {
  cluster_id = yandex_mdb_mysql_cluster.netology.id
  name       = "netology_db"
}

resource "yandex_mdb_mysql_user" "user" {
  cluster_id = yandex_mdb_mysql_cluster.netology.id
  name       = var.user_db
  password   = var.paas_db
  permission {
    database_name = yandex_mdb_mysql_database.netology_db.name
    roles         = ["ALL"]
  }
}

