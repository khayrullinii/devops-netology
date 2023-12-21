resource "yandex_vpc_subnet" "netology3" {
  name           = var.vpc_name
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = ["192.168.100.0/24"]
}

resource "yandex_vpc_subnet" "netology4" {
  name           = "public-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = ["192.168.200.0/24"]
}

resource "yandex_vpc_subnet" "netology5" {
  name           = "public-c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.netology.id
  v4_cidr_blocks = ["192.168.250.0/24"]
}

resource "yandex_kubernetes_cluster" "k8s-regional" {
  network_id = yandex_vpc_network.netology.id
  master {
    version = "1.28"
    public_ip = true
    regional {
      region = "ru-central1"
      location {
        zone      = yandex_vpc_subnet.netology3.zone
        subnet_id = yandex_vpc_subnet.netology3.id
      }
      location {
        zone      = yandex_vpc_subnet.netology4.zone
        subnet_id = yandex_vpc_subnet.netology4.id
      }
      location {
        zone      = yandex_vpc_subnet.netology5.zone
        subnet_id = yandex_vpc_subnet.netology5.id
      }
    }
  }
  service_account_id      = yandex_iam_service_account.myaccount.id
  node_service_account_id = yandex_iam_service_account.myaccount.id
  depends_on = [
    yandex_resourcemanager_folder_iam_member.k8s-clusters-agent,
    yandex_resourcemanager_folder_iam_member.vpc-public-admin,
    yandex_resourcemanager_folder_iam_member.images-puller
  ]
  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }
}


resource "yandex_iam_service_account" "myaccount" {
  name        = "kuber"
  description = "K8S regional service account"
}

resource "yandex_resourcemanager_folder_iam_member" "k8s-clusters-agent" {
  # Сервисному аккаунту назначается роль "k8s.clusters.agent".
  folder_id = var.folder_id
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${yandex_iam_service_account.myaccount.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
  # Сервисному аккаунту назначается роль "vpc.publicAdmin".
  folder_id = var.folder_id
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${yandex_iam_service_account.myaccount.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
  # Сервисному аккаунту назначается роль "container-registry.images.puller".
  folder_id = var.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.myaccount.id}"
}

resource "yandex_kms_symmetric_key" "kms-key" {
  # Ключ для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
  name              = "kms-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}

resource "yandex_resourcemanager_folder_iam_member" "viewer" {
  folder_id = var.folder_id
  role      = "viewer"
  member    = "serviceAccount:${yandex_iam_service_account.myaccount.id}"
}


resource "yandex_kubernetes_node_group" "kubergr" {
  cluster_id = yandex_kubernetes_cluster.k8s-regional.id
  version = "1.28"
  name       = "kubergr"
  instance_template {
    name       = "kuber-{instance.short_id}-{instance_group.id}"
    platform_id = "standard-v1"
    network_acceleration_type = "standard"
    resources {
      memory = 2
      cores  = 2
    }


    boot_disk {
      type = "network-hdd"
      size = 64
    }
    container_runtime {
     type = "containerd"
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.netology3.id
    }
  }

  scale_policy {
    auto_scale {
      min     = 3
      max     = 6
      initial = 3
    }
  }
}