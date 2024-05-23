resource "yandex_dataproc_cluster" "dataproc-cluster" {
  description        = "Yandex Data Proc cluster"
  name               = "dataproc-cluster"
  service_account_id = yandex_iam_service_account.data_proc_sa.id
  zone_id            = "ru-central1-a"
  bucket             = yandex_storage_bucket.data_bucket.id

  security_group_ids = [
    yandex_vpc_security_group.dataproc-sg.id
  ]

  cluster_config {
    hadoop {
      services = ["HDFS", "YARN", "SPARK", "HDFS"]
      ssh_public_keys = [
        file("~/.ssh/id_ed25519.pub")
      ]
    }

    subcluster_spec {
      name        = "subcluster-master"
      role        = "MASTERNODE"
      subnet_id   = yandex_vpc_subnet.subnet.id
      hosts_count = 1 # For MASTERNODE only one hosts assigned

      resources {
        resource_preset_id = "s3-c2-m8"    # 4 vCPU Intel Cascade, 16 GB RAM
        disk_type_id       = "network-ssd" # Fast network SSD storage
        disk_size          = 40            # GB
      }

    }

    subcluster_spec {
      name        = "subcluster-data"
      role        = "DATANODE"
      subnet_id   = yandex_vpc_subnet.subnet.id
      hosts_count = 3

      resources {
        resource_preset_id = "s3-c4-m16"    # 4 vCPU, 16 GB RAM
        disk_type_id       = "network-ssd" # Fast network SSD storage
        disk_size          = 128           # GB
      }
    }
  }
}