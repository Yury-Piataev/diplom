# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = ""
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = ""
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
#variable "ubuntu-2004" {
#  default = "fd839s3s7ep5311u7a8l"    yc - "fd8kdq6d0p8sij7h5qe3"
#}

# Ubuntu 20.04 LTS - от YC.
variable "ubuntu-2004" {
  default = "fd8kdq6d0p8sij7h5qe3"
}

# Ubuntu 18.04 nat instans - от YC.
variable "ubuntu-nat" {
  default = "fd8v7ru46kt3s4o5f0uo"
}

# access_key = "<идентификатор статического ключа>"
variable "access_key" {
  default = ""
}

# secret_key = "<секретный ключ>"
variable "secret_key" {
  default = "-"
}



# ssh_common_args 
#variable "ssh-common" {
#  default = "ansible_ssh_extra_args='-o StrictHostKeyChecking=no' ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/user-pc ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i ~/.ssh/user-pc -o StrictHostKeyChecking=no -q ubuntu@${yandex_compute_instance.revers.network_interface.0.nat_ip_address}"'"
#}
