resource "aws_db_subnet_group" "example" {
  name = "${var.name}-subnetgroup"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name}-subnetgroup"
  }
}

resource "aws_db_instance" "example" {
  allocated_storage = 10
  storage_type = var.storage_type
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  identifier = "${var.name}-instance"
  username = var.username
  password = var.password

  vpc_security_group_ids = var.aws_security_group_ids
  db_subnet_group_name = aws_db_subnet_group.example.name

  skip_final_snapshot = true
}