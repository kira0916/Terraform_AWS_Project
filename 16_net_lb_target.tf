resource "aws_lb_target_group" "company_nlbta" {
  name     = "company-nlbta"
  port     = 8009
  protocol = "TCP"
  vpc_id   = aws_vpc.company_vpc.id
  target_type = "instance"

health_check {
    enabled             = true
    port                = "8009"
    protocol            = "TCP"
  }
}
