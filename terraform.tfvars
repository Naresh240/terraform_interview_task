## Base variables
region = "us-east-1"
name   = "example"

### vpc variables
vpc_cidr     = "10.0.0.0/16"
subnets_cidr = ["10.0.0.0/24", "10.0.1.0/24"]

## security group ports
ports = ["22", "80", "3306"]

## Instance variables
image_id  = "ami-0e731c8a588258d0d"
inst_type = "t3.xlarge"
key_name  = "awsdevops"

## bucket variables
bucket_name = "example-12321221"
bucket_acl  = "private"

## rds variables

storage_type   = "gp2"
engine         = "mysql"
engine_version = "5.7"
instance_class = "db.t3.micro"
username       = "naresh"
password       = "QWRtaW4jMTIz"

## route53 variables
hosted_zone_name = "devopstechtrainer.com"