variable "name" {
  type = string
  default = "mysql"
}

variable "network_id" {
  type = string
}

variable "zone" {
  type = string
  default = "ru-central1-a"
}

variable "subnet_id" {
  type = string
}

variable "HA" {
  type = bool
  default = false
}