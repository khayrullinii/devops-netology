resource "yandex_compute_instance" "each_vm" {
  depends_on = [resource.yandex_compute_instance.count_vm]
  for_each = {"netology-each-1" = { cpu=2, ram=2, disk=15},
            "netology-each-2" = { cpu=4, ram=4, disk=10}}
  name        = each.key
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
      type        = "network-hdd"
      size        = each.value.disk
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = "1"
    ssh-keys           = local.server_ssh_key
  }

}