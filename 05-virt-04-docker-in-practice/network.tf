resource "yandex_vpc_network" "network-1" {
  name = var.network_name # Используем переменную имени сети
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet-1"
  zone           = var.zone # Используем переменную зоны
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = [var.subnet_cidr_block] # Используем переменную подсети
}

# Группа безопасности LAN (Разрешает внутренний трафик)
resource "yandex_vpc_security_group" "LAN" {
  name       = "LAN"
  network_id = yandex_vpc_network.network-1.id

  ingress {
    protocol       = "ANY"
    description    = "Allow any communication inside security group"
    v4_cidr_blocks = [var.subnet_cidr_block] # Динамическая подсеть
  }

  egress {
    protocol       = "ANY"
    description    = "Allow any outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

# Группа безопасности для Web (Открывает порты наружу)
resource "yandex_vpc_security_group" "sg-web" {
  name       = "sg-web"
  network_id = yandex_vpc_network.network-1.id

  ingress {
    protocol       = "TCP"
    description    = "Allow SSH"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    description    = "Allow Ingress Proxy port 8090"
    port           = 8090
    v4_cidr_blocks = ["0.0.0.0/0"] # Открыто для проверок Check-Host со всего мира
  }

  egress {
    protocol       = "ANY"
    description    = "Allow out traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
