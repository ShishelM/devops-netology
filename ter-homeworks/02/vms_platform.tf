# АКТУАЛЬНЫЕ ПЕРЕМЕННЫЕ (ЗАДАНИЕ 6)

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона доступности для базы данных"
}

# Единственная map-переменная для обеих ВМ
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    platform_id   = string
    preemptible   = bool
    nat           = bool
  }))
  description = "Ресурсы процессора, памяти и флаги для всех типов ВМ"
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 50
      platform_id   = "standard-v3"
      preemptible   = true
      nat           = true
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      platform_id   = "standard-v3"
      preemptible   = true
      nat           = true
    }
  }
}

# Общая переменная для блока metadata и ОС
variable "vm_metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
    family             = string
  })
  description = "Общие метаданные, SSH-ключи и ОС для всех ВМ"
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH1aldsXuAs62u6zs8rqqAzylhg6foOlY8uOqCadg4MY jonyblaze2019@gmail.com" 
    family             = "ubuntu-2004-lts"
  }
}



# СТАРЫЕ ПЕРЕМЕННЫЕ (БОЛЕЕ НЕ ИСПОЛЬЗУЮТСЯ)
/*
variable "vm_web_metadata" {
  type = map(string)
  default = {
    name        = "netology-develop-platform-web"
    platform_id = "standard-v3"
    family      = "ubuntu-2004-lts"
  }
}

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

variable "vm_web_flags" {
  type = object({
    preemptible        = bool
    nat                = bool
    serial_port_enable = number
  })
  default = {
    preemptible        = true
    nat                = true
    serial_port_enable = 1
  }
}

variable "vm_db_metadata" {
  type = map(string)
  default = {
    name        = "netology-develop-platform-db"
    platform_id = "standard-v3"
    family      = "ubuntu-2004-lts"
  }
}

variable "vm_db_resources" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

variable "vm_db_flags" {
  type = object({
    preemptible        = bool
    nat                = bool
    serial_port_enable = number
  })
  default = {
    preemptible        = true
    nat                = true
    serial_port_enable = 1
  }
}
*/
