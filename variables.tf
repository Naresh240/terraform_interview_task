variable "region" {
  type = string
}

variable "name" {
  type = string
}

#################################################################
################### vpc Variable Declaration ####################
#################################################################
variable "vpc_cidr" {
  description = "vpc cidr range"
  type        = string
}

variable "subnets_cidr" {
  description = "subnet cidr ranges"
  type        = list(string)
}

#####################################################################
############### SecurityGroup Variable Declaration ##################
#####################################################################
variable "ports" {
  type = list(string)
}

#####################################################################
#################### bucket Variable Declaration ####################
#####################################################################

variable "bucket_name" {
  type = string
}

variable "bucket_acl" {
  type    = string
  default = "private"
}

#####################################################################
#################### database Variable Declaration ##################
#####################################################################

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
  type      = string
  sensitive = true
}


#####################################################################
################## instance Variable Declaration ####################
#####################################################################

variable "image_id" {
  type = string
}

variable "inst_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "hosted_zone_name" {
  type = string
}