data "aws_availability_zones" "available" {}

resource "aws_subnet" "example" {
  count = length(var.subnets_cidr)

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = var.subnets_cidr[count.index]
  vpc_id            = aws_vpc.example.id
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-${count.index}"
  }
}