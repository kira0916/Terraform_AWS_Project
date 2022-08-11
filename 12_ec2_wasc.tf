resource "aws_instance" "hychai_ec2_WASC" {
  ami                         = "ami-0e1d09d8b7c751816"
  instance_type               = "t2.micro"
  key_name                    = "heeyun"
  vpc_security_group_ids      = [aws_security_group.hychai_sec.id]
  availability_zone           = "ap-northeast-2c"
  subnet_id                   = aws_subnet.hychai_wasc.id
  associate_public_ip_address = true
  user_data                   = file("install1.sh")
    tags = {
      "Name" = "WASC"
    }
}
