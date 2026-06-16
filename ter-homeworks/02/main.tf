# 1. Создание сети
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# 2. Подсеть для первой ВМ (Зона А)
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

# 3. Подсеть для второй ВМ (Зона B)
resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.vpc_name}-b"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}

# 4. Источник данных для образа Ubuntu
data "yandex_compute_image" "ubuntu" {
  family = var.vm_metadata.family
}

# 5. Первая ВМ
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vms_resources.web.platform_id
  zone        = var.default_zone
  
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vms_resources.web.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vms_resources.web.nat
  }
  metadata = {
    serial-port-enable = var.vm_metadata.serial-port-enable
    ssh-keys           = var.vm_metadata.ssh-keys
  }
}

# 6. Вторая ВМ
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = var.vms_resources.db.platform_id
  zone        = var.vm_db_zone
  
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vms_resources.db.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = var.vms_resources.db.nat
  }
  metadata = {
    serial-port-enable = var.vm_metadata.serial-port-enable
    ssh-keys           = var.vm_metadata.ssh-keys
  }
}
