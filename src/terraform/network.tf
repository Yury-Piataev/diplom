
# Network
resource "yandex_vpc_network" "diplom_net" {
  name = "net"
}

resource "yandex_vpc_route_table" "rt" {
  network_id = "${yandex_vpc_network.diplom_net.id}"
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.101.11"
    #gateway_id         = "${yandex_vpc_gateway.nat-gateway.id}"
    }
}

resource "yandex_vpc_subnet" "diplom_subnet" {
  name = "subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.diplom_net.id}"
  v4_cidr_blocks = ["192.168.101.0/24"]
  route_table_id = "${yandex_vpc_route_table.rt.id}"
}

resource "yandex_dns_zone" "diplom" {
  folder_id = "${var.yandex_folder_id}"
  name    = "diplom"
  zone    = "piataev.ru."
  public  = true
  # private_networks = ["${yandex_vpc_network.diplom_net.id}"]
  depends_on = [yandex_vpc_subnet.diplom_subnet]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = "${yandex_dns_zone.diplom.id}"
  name    = "@.piataev.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.revers]
}

resource "yandex_dns_recordset" "www" {
  zone_id = "${yandex_dns_zone.diplom.id}"
  name    = "www.piataev.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.revers]
}

resource "yandex_dns_recordset" "gitlab" {
  zone_id = "${yandex_dns_zone.diplom.id}"
  name    = "gitlab.piataev.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.revers]
}

resource "yandex_dns_recordset" "alertmanager" {
  zone_id = "${yandex_dns_zone.diplom.id}"
  name    = "alertmanager.piataev.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.revers]
}

resource "yandex_dns_recordset" "grafana" {
  zone_id = "${yandex_dns_zone.diplom.id}"
  name    = "grafana.piataev.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.revers]
}

resource "yandex_dns_recordset" "prometheus" {
  zone_id = "${yandex_dns_zone.diplom.id}"
  name    = "prometheus.piataev.ru."
  type    = "A"
  ttl     = 200
  data    = ["${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"]
  depends_on = [yandex_compute_instance.revers]
}



#resource "yandex_vpc_address" "addr" {
#  name = "piataev_addr"
#  external_ipv4_address {
#    zone_id = "ru-central1-a"
#  }
#}