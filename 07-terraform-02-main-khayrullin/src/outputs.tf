output "external_ip_address_platform" {
  value = "${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}

output "external_ip_address_platform1" {
  value = "${yandex_compute_instance.platform1.network_interface.0.nat_ip_address}"
}