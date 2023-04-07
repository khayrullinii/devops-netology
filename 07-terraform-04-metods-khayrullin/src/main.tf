terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}



module "mysql" {
  source = "/home/ilnur/terraform/ter-homeworks/04/mysql_module"
  name = "mysql"
  network_id = "enpsqtm42eqogoa659gn"
  subnet_id = "e9b12boi6c2ajfjouu8t"
}


module "db" {
  source = "/home/ilnur/terraform/ter-homeworks/04/db_module"
  db_name = "test"
  cluster_id = module.mysql.cluster_id.id
  user_name = "app"
  pswd  =  "test1234"
}