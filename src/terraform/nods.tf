resource "yandex_compute_instance" "revers" {
  name                      = "revers"
  zone                      = "ru-central1-a"
  hostname                  = "piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    nat        = true
    ipv6       = false
    ip_address = "192.168.101.11"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}  

resource "yandex_compute_instance" "db01" {
  name                      = "db01"
  zone                      = "ru-central1-a"
  hostname                  = "db01.piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    # nat        = true
    ipv6        = false
    ip_address = "192.168.101.12"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "db02" {
  name                      = "db02"
  zone                      = "ru-central1-a"
  hostname                  = "db02.piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    # nat        = true
    ipv6        = false
    ip_address = "192.168.101.13"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "app" {
  name                      = "app"
  zone                      = "ru-central1-a"
  hostname                  = "app.piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    #nat        = true
    ipv6       = false
    ip_address = "192.168.101.14"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "gitlab" {
  name                      = "gitlab"
  zone                      = "ru-central1-a"
  hostname                  = "gitlab.piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    # nat        = true
    ipv6       = false
    ip_address = "192.168.101.15"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "runner" {
  name                      = "runner"
  zone                      = "ru-central1-a"
  hostname                  = "runner.piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    #nat        = true
    ipv6       = false
    ip_address = "192.168.101.16"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "monitoring" {
  name                      = "monitoring"
  zone                      = "ru-central1-a"
  hostname                  = "monitoring.piataev.ru"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu-2004}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.diplom_subnet.id}"
    # nat        = true
    ipv6       = false
    ip_address = "192.168.101.17"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
