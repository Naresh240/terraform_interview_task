variable "key_name" {
  type = string
}

variable "public_ips" {
  type = list(string)
}

variable "username" {
  type = string
}

variable "password" {
    type = string
    sensitive   = true
}

variable "dbname" {
  type = string
}
variable "rdsendpoint" {
  type = string
}
