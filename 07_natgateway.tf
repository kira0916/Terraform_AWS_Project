#natgateway 에서 사용할 eip 주소를 생성한다
resource "aws_eip" "hychai_natip" {
  vpc = true
}

resource "aws_nat_gateway" "hychai_NAT" {
  allocation_id = aws_eip.hychai_natip.id
  subnet_id     = aws_subnet.hychai_weba.id
  tags = {
    "Name" = "hychai-natgate"
  }
  depends_on = [
    aws_internet_gateway.hychai_ig
  ]
}
