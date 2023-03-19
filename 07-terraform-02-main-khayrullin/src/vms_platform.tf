variable "vm_web_resources" {
    type = map(number)
    default = {
        cores = 2
        memory = 2
        core_fraction = 5
    }
}

variable "vm_db_resources" {
    type = map(number)
    default = {
        cores = 2
        memory = 2
        core_fraction = 20
    }
}

variable "metadata" {
    type = map(string)
    default = {
        serial-port-enable = "1"
        ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnGdtIS22c36/P3+ZfMUN01Tluu2GZJhl9e0tlP7pn06wHgmZOVv6L9x2cNAUiTMX2rVLZe4NaAJrseWMscgk5VJyqfEl8keD+ZVpv/EHJV+gI3tHu0hjfbnRcgKwdqKvjqiaaN9VdH055HnAH2xgDT1G39Sk170L1kO9jSQUH4IOy+qsoe3dd8EPFfopWLR73Q03EMUMHbCMjqXuTaNFXmqjXXDPB/+m53RxSMYYw6TYHPZWknaalO80XIvPnNnhdRZQ3mQtjbzi84slqfDiLj/zUbw/18Qm8p7dX11/qNKxj+/v4pNRmpOU+/Kk4yuoOLd6Ch+EZ5VI3LdX8ynC6PIWdfvDUrujwqF1GWi7wS6FaLQMQRcij6H6S0SkUh8Qew2a4gkrF+xQdf8GZ1yB6hY6EzyhTOW6ImaHgL1ZUOlI4h7QVZlnB9X975pWhHLNTfxmQxc+IFD4dGDjkED07UmJo+VGZ1HVmUNx4GJqPwqOlla5d0Iut+QBOLO3kt8M="
    }
}
variable "vm_platform" {
  type        = string
  default     = "standard-v1"
  description = "VM platform name"
}


