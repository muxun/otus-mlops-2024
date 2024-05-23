
resource "yandex_iam_service_account" "sa-s3-editor" {
   name = "otus-mlops2024-s3-editor"
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor-rolebinding" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa-s3-editor.id}"
}

// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-s3-editor-static-key" {
  service_account_id = yandex_iam_service_account.sa-s3-editor.id
  description        = "static access key for object storage"
}

// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "otus-mlops2024-s3" {
  access_key = yandex_iam_service_account_static_access_key.sa-s3-editor-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-s3-editor-static-key.secret_key
  bucket     = "otus-mlops-s3"
}

