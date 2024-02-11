variable "name" {
  type = string
}

variable "vpc_cidr" {
  description = "vpc cidr range"
  type = string
}

variable "subnets_cidr" {
  description = "subnet cidr ranges"
  type = list(string)
}