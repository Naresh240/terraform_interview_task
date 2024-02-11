data "aws_availability_zones" "available" {}

resource "aws_instance" "example" {
  count         = 2

  ami           = var.image_id
  instance_type = var.inst_type
  vpc_security_group_ids = var.aws_security_group_ids
  subnet_id     = element(var.subnet_id, count.index)
  key_name = var.key_name
  availability_zone = data.aws_availability_zones.available.names[count.index]
  associate_public_ip_address = true

  tags = {
    Name = "${var.name}-instance"
  }
}
