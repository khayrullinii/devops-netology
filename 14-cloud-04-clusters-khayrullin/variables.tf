###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vpc_name_private" {
  type        = string
  default     = "private"
  description = "VPC network&subnet name"
}

variable "user_db" {
  type        = string
  default     = "user1"
  description = "user for database"
}

variable "paas_db" {
  type        = string
  default     = "useruser1"
  description = "password for database"
}