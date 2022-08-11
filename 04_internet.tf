resource "aws_internet_gateway" "hychai_ig" {
  vpc_id = aws_vpc.hychai_vpc.id
  tags = {
    "Name" = "IG"
  }
}
