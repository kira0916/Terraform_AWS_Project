resource "aws_lb_target_group" "hychai_nlbta" {
  name     = "hychai-nlbta"
  port     = 8009
  protocol = "TCP"
  vpc_id   = aws_vpc.hychai_vpc.id
  target_type = "instance"

health_check {
    enabled             = true
    port                = "8009"
    protocol            = "TCP"
  }
}
