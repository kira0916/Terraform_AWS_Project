resource "aws_lb" "hychai_nlb" {
  name            = "hychai-nlb"
  load_balancer_type = "network"
  internal        = true
  subnets         = [aws_subnet.hychai_wasa.id, aws_subnet.hychai_wasc.id]
  tags = {
    "Name" = "hychai-nlb"
  }
}
output "dns_name_nlb" {
  value = aws_lb.hychai_nlb.dns_name
}
