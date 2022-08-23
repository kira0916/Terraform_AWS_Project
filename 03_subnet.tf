#가용영역 a,c에 public subnet 생성
resource "aws_subnet" "company_weba" {
  vpc_id            = aws_vpc.company_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "company-weba"
  }
}

resource "aws_subnet" "company_webc" {
  vpc_id            = aws_vpc.company_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "company-webc"
  }
}

resource "aws_subnet" "company_wasa" {
  vpc_id            = aws_vpc.company_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "company-wasa"
  }
}

resource "aws_subnet" "company_wasc" {
  vpc_id            = aws_vpc.company_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "company-wasc"
  }
}

resource "aws_subnet" "company_dba" {
  vpc_id            = aws_vpc.company_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "company-dba"
  }
}

resource "aws_subnet" "company_dbc" {
  vpc_id            = aws_vpc.company_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "company-dbc"
  }
}
