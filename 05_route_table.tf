resource "aws_route_table" "company_rt" {
  vpc_id = aws_vpc.company_vpc.id
  # 0.0.0.0/0은 모두 company_ig를 통해서 나간다
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.company_ig.id
  }
  tags = {
    "Name" = "company-rt"
  }
}
