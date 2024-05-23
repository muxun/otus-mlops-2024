resource "yandex_vpc_network" "net" {
  name        = "dataproc-net"
  description = "otus-dataproc"
}

resource "yandex_vpc_subnet" "subnet" {
  folder_id      = var.folder_id
  name           = "dataproc-subnet"
  v4_cidr_blocks = ["10.20.30.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.net.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = "dataproc-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = var.folder_id
  name       = "dataproc-route-table"
  network_id =  yandex_vpc_network.net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

