resource "aws_alb" "hychai_alb" {
  name            = "hychai-alb"
  internal        = false
  subnets         = [aws_subnet.hychai_weba.id, aws_subnet.hychai_webc.id]
  security_groups = [aws_security_group.hychai_sec.id]
  tags = {
    "Name" = "hychai-alb"
  }
}
output "dns_name" {
  value = aws_alb.hychai_alb.dns_name
}
