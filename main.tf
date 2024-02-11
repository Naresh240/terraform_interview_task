module "vpc" {
  source = "./vpc"

  name         = var.name
  vpc_cidr     = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
}

module "SecurityGroup" {
  source = "./security-group"

  name   = var.name
  vpc_id = module.vpc.vpc_id
  ports  = var.ports

  depends_on = [
    module.vpc
  ]
}

# module "bucket" {
#   source = "./bucket"

#   bucket_name = var.bucket_name
#   bucket_acl  = var.bucket_acl
# }

module "rds" {
  source = "./rds"

  name                   = var.name
  subnet_ids             = module.vpc.subnet_ids
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  aws_security_group_ids = [module.SecurityGroup.Securitygroup_id]

  depends_on = [
    module.vpc
  ]
}


module "instance" {
  source = "./instance"

  name                   = var.name
  image_id               = var.image_id
  inst_type              = var.inst_type
  aws_security_group_ids = [module.SecurityGroup.Securitygroup_id]
  subnet_id              = module.vpc.subnet_ids
  key_name               = var.key_name

  depends_on = [
    module.SecurityGroup,
    module.rds
  ]
}

# module "wordpress" {
#   source = "./wordpress"

#   key_name    = file("${var.key_name}.pem")
#   public_ips  = module.instance.public_ips
#   username    = var.username
#   password    = var.password
#   dbname      = module.rds.dbname
#   rdsendpoint = module.rds.rdsendpoint

#   depends_on = [
#     module.instance
#   ]
# }

module "alb" {
  source = "./alb"

  name                   = var.name
  vpc_id                 = module.vpc.vpc_id
  aws_security_group_ids = [module.SecurityGroup.Securitygroup_id]
  subnet_ids             = module.vpc.subnet_ids
  instance_ids           = module.instance.instance_ids

  depends_on = [
    module.instance
  ]
}

module "route53" {
  source = "./route53"

  name             = var.name
  hosted_zone_name = var.hosted_zone_name
  dns_name         = module.alb.dns_name
  zone_id          = module.alb.zone_id
}   