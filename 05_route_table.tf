resource "aws_route_table" "hychai_rt" {
  vpc_id = aws_vpc.hychai_vpc.id
  # 0.0.0.0/0은 모두 hychai_ig를 통해서 나간다
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hychai_ig.id
  }
  tags = {
    "Name" = "hychai-rt"
  }
}
