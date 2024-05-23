resource "yandex_vpc_security_group" "dataproc-sg" {
  name        = "dataproc security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.net.id


  ingress {
    protocol          = "ANY"
    description       = "Разрешает взаимодействие между ресурсами текущей группы безопасности"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }

  ingress {
    protocol       = "TCP"
    description    = "https ingress"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }

  ingress {
    protocol       = "TCP"
    description    = "ssh ingress"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }


  egress {
    protocol          = "ANY"
    description       = "Разрешает взаимодействие между ресурсами текущей группы безопасности"
    predefined_target = "self_security_group"
    from_port         = 0
    to_port           = 65535
  }

  egress {
    protocol       = "TCP"
    description    = "https egress"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }

  egress {
    protocol       = "UDP"
    description    = "ntp egress"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 123
  }
}

