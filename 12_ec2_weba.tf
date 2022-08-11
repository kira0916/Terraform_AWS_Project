
resource "aws_instance" "hychai_ec2_WEBA" {
  ami                         = "ami-0e1d09d8b7c751816"
  instance_type               = "t2.micro"
  key_name                    = "heeyun"
  vpc_security_group_ids      = [aws_security_group.hychai_sec.id]
  availability_zone           = "ap-northeast-2a"
  subnet_id                   = aws_subnet.hychai_weba.id
  associate_public_ip_address = true
  user_data                   = file("install.sh")
    tags = {
      "Name" = "WEBA"
    }
}

output "public_ip" {
  value = aws_instance.hychai_ec2_WEBA.public_ip
}

