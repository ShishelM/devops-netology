# Считываем данные об образе ОС
data "yandex_compute_image" "ubuntu_2204_lts" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_disk" "boot-disk-1" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = var.zone 
  size     = "20"
  image_id = data.yandex_compute_image.ubuntu_2204_lts.image_id
}

# Виртуалка
resource "yandex_compute_instance" "web" {
  name     = "web"
  hostname = "web"
  zone     = var.zone 

  resources {
    cores         = var.test.cores
    memory        = var.test.memory 
    core_fraction = var.test.core_fraction
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-1.id
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet-1.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.LAN.id, yandex_vpc_security_group.sg-web.id]
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
    serial-port-enable = 1
  }
}

# Выводим публичный IP адрес в консоль после сборки
output "public_ip" {
  value = yandex_compute_instance.web.network_interface.0.nat_ip_address
}
