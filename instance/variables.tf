variable "name" {
  type = string
}

variable "image_id" {
  type = string
}

variable "inst_type" {
  type = string
}

variable "aws_security_group_ids" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}
