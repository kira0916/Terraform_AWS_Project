resource "aws_route_table" "company_natrt" {
  vpc_id = aws_vpc.company_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.company_NAT.id
  }
  tags = {
    "Name" = "company-natrt"
  }
}
