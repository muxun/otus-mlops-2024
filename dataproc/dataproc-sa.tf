resource "yandex_iam_service_account" "data_proc_sa" {
  name        = "dataproc-sa"
  description = "dataproc creator editor"
}

resource "yandex_resourcemanager_folder_iam_member" "dataproc-agent" {
  folder_id = var.folder_id
  role      = "dataproc.agent"
  member    = "serviceAccount:${yandex_iam_service_account.data_proc_sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "dataproc-user" {
  folder_id = var.folder_id
  role      = "dataproc.user"
  member    = "serviceAccount:${yandex_iam_service_account.data_proc_sa.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "bucket-creator" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.data_proc_sa.id}"
}


resource "yandex_iam_service_account_static_access_key" "sa_static_key" {
  service_account_id = yandex_iam_service_account.data_proc_sa.id
}

resource "yandex_storage_bucket" "data_bucket" {
  depends_on = [
    yandex_resourcemanager_folder_iam_member.bucket-creator
  ]

  bucket     = "otus-mlops2024-dataproc-data"
  access_key = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
}
