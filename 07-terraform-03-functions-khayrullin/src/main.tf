
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "local_file" "hosts_cfg" {
  depends_on = [yandex_compute_instance.disk_vm, yandex_compute_instance.each_vm, yandex_compute_instance.count_vm]
  content = templatefile("${path.module}/hosts.tftpl",

    {count_vm =  yandex_compute_instance.count_vm,
     each_vm =  yandex_compute_instance.each_vm,
     disk_vm =  yandex_compute_instance.disk_vm
     }  )

  filename = "${abspath(path.module)}/hosts.cfg"
}

resource "null_resource" "hosts_provision" {
  depends_on = [yandex_compute_instance.disk_vm, yandex_compute_instance.each_vm, yandex_compute_instance.count_vm]

  
  provisioner "local-exec" {
    command = "sleep 30"
  }

  provisioner "local-exec" {                  
      command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.cfg ${abspath(path.module)}/test.yml"
      on_failure = continue
      environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
    }
}