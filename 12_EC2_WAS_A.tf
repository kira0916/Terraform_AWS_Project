resource "aws_instance" "company_ec2_WASA" {
  ami                         = "ami-01711d925a1e4cc3a"
  instance_type               = "t2.small"
  key_name                    = "heeyun"
  vpc_security_group_ids      = [aws_security_group.company_sec.id]
  availability_zone           = "ap-northeast-2a"
  subnet_id                   = aws_subnet.company_wasa.id
  user_data                   = file("install_WAS_A.sh")
    tags = {
      "Name" = "WASA"
    }
}
