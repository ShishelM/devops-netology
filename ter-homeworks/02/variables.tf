### cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gj3qbamvs4h8r8keio"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g9af9fe1gsnt7r0n36"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

### ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1aldsXuAs62u6zs8rqqAzylhg6foOlY8uOqCadg4MY jonyblaze2019@gmail.com"
  description = "ssh-keygen -t ed25519"
}


/*
# Текстовые параметры идентификации ВМ
variable "vm_web_metadata" {
  type        = map(string)
  description = "Имена, платформы и образы для веб-ВМ"
  default = {
    name        = "netology-develop-platform-web"
    platform_id = "standard-v3"
    family      = "ubuntu-2004-lts"
  }
}

# Вычислительные ресурсы ВМ
variable "vm_web_resources" {
  type        = map(number)
  description = "Ресурсы процессора и памяти для веб-ВМ"
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 50
  }
}

# Системные и сетевые флаги ВМ
variable "vm_web_flags" {
  type = object({
    preemptible        = bool
    nat                = bool
    serial_port_enable = number
  })
  description = "Сетевые настройки и системные флаги"
  default = {
    preemptible        = true
    nat                = true
    serial_port_enable = 1
  }
}
*/