resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tpl", {
    # webservers — это список, созданный через count
    webservers = yandex_compute_instance.web
    
    # databases — это map, созданный через for_each. Передаем только значения (values)
    databases  = values(yandex_compute_instance.db)
    
    # storage — это одиночная ВМ. Оборачиваем её в [ ], чтобы шаблон обработал её как список из 1 элемента
    storage    = [yandex_compute_instance.storage]
  })
  
  filename = "${path.module}/hosts.ini"
}
