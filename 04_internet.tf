resource "aws_internet_gateway" "company_ig" {
  vpc_id = aws_vpc.company_vpc.id
  tags = {
    "Name" = "IG"
  }
}
