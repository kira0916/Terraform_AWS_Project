resource "aws_route_table" "hychai_natrt" {
  vpc_id = aws_vpc.hychai_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.hychai_NAT.id
  }
  tags = {
    "Name" = "hychai-natrt"
  }
}
