#가용영역 a,c에 public subnet 생성
resource "aws_subnet" "hychai_weba" {
  vpc_id            = aws_vpc.hychai_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hychai-weba"
  }
}

resource "aws_subnet" "hychai_webc" {
  vpc_id            = aws_vpc.hychai_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hychai-webc"
  }
}

resource "aws_subnet" "hychai_wasa" {
  vpc_id            = aws_vpc.hychai_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hychai-wasa"
  }
}

resource "aws_subnet" "hychai_wasc" {
  vpc_id            = aws_vpc.hychai_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hychai-wasc"
  }
}

resource "aws_subnet" "hychai_dba" {
  vpc_id            = aws_vpc.hychai_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "hychai-dba"
  }
}

resource "aws_subnet" "hychai_dbc" {
  vpc_id            = aws_vpc.hychai_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "hychai-dbc"
  }
}
