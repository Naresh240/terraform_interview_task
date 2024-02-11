resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
}

resource "aws_route_table_association" "example" {
  count = 2

  subnet_id      = aws_subnet.example.*.id[count.index]
  route_table_id = aws_route_table.example.id
}