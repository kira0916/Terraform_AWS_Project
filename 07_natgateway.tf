#natgateway 에서 사용할 eip 주소를 생성한다
resource "aws_eip" "company_natip" {
  vpc = true
}

resource "aws_nat_gateway" "company_NAT" {
  allocation_id = aws_eip.company_natip.id
  subnet_id     = aws_subnet.company_weba.id
  tags = {
    "Name" = "company-natgate"
  }
  depends_on = [
    aws_internet_gateway.company_ig
  ]
}
