locals {
  ingress_ports = var.ports
}

resource "aws_security_group" "example" {
  name = var.name
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each  = local.ingress_ports

    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "${var.name}-sg"
  }
}