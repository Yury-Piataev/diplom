# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  #backend "s3" {
   # endpoint   = "storage.yandexcloud.net"
   # key        = ".terraform/terraform.tfstate"
   # bucket     = "stage"
   # region     = "ru-central1"
   # access_key = "YCAJEC_kaT11hPZ8Dupoq_oIH"
   # secret_key = "YCOrfpMaB8JvZKL8n-T1xnmo6UbxtU67oPlDyxWp"
   # encrypt    = true
    #force_destroy = true
#
   # skip_region_validation      = true
   # skip_credentials_validation = true
  #}
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}
