locals {
  # Шаблон: "префикс_сети-окружение-тип_вм"
  vm_web_name = "${var.vpc_name}-platform-web"
  vm_db_name  = "${var.vpc_name}-platform-db"
}