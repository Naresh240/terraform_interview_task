variable "name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "storage_type" {
    type = string
}
variable "engine" {
    type = string
}
variable "engine_version" {
    type = string
}
variable "instance_class" {
    type = string
}
variable "username" {
    type = string
}
variable "password" {
    type = string
    sensitive   = true
}

variable "aws_security_group_ids" {
    type = list(string)
}