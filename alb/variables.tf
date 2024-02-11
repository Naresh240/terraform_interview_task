variable "name" {
  type = string
}

variable "aws_security_group_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
    type = string
}

variable "instance_ids" {
    type = list(string)
}