terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"



 backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tfstate-lock-netology"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    

    skip_region_validation      = true
    skip_credentials_validation = true

    dynamodb_endpoint           = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gtev67qer2l3jn4tin/etn9rmce2m1vgrevpno3"
    dynamodb_table              = "tfsatate"
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}


module "vpc_module" {
  source = "/home/ilnur/terraform/ter-homeworks/04/vpc_module"
  vpc_name = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.vpc_module.vpc.id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.vpc_module.subnet[0].id ]
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2204-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered 
      serial-port-enable = 1
  }

}


data "template_file" "cloudinit" {
 template = file("/home/ilnur/terraform/ter-homeworks/04/demonstration1/cloud-init.yml")
 vars = {
  ssh_authorized_keys = local.server_ssh_key
 }
}