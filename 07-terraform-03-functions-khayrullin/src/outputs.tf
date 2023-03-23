output "VMs_count" {
  value = toset([{
  "name" = "${yandex_compute_instance.count_vm[0].name}",
  "id"   = "${yandex_compute_instance.count_vm[0].id}",
  "fqdn" = "${yandex_compute_instance.count_vm[0].fqdn}"
 },
 {
  "name" = "${yandex_compute_instance.count_vm[1].name}",
  "id"   = "${yandex_compute_instance.count_vm[1].id}",
  "fqdn" = "${yandex_compute_instance.count_vm[1].fqdn}"
 },
 {
  "name" = "${yandex_compute_instance.each_vm["netology-each-1"].name}",
  "id"   = "${yandex_compute_instance.each_vm["netology-each-1"].id}",
  "fqdn" = "${yandex_compute_instance.each_vm["netology-each-1"].fqdn}"
 },
 {
  "name" = "${yandex_compute_instance.each_vm["netology-each-2"].name}",
  "id"   = "${yandex_compute_instance.each_vm["netology-each-2"].id}",
  "fqdn" = "${yandex_compute_instance.each_vm["netology-each-2"].fqdn}"
 },
 {
  "name" = "${yandex_compute_instance.disk_vm[0].name}",
  "id"   = "${yandex_compute_instance.disk_vm[0].id}",
  "fqdn" = "${yandex_compute_instance.disk_vm[0].fqdn}"
 }])
}
