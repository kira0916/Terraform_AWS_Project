resource "aws_lb_listener" "company_nlbli" {
  load_balancer_arn = aws_lb.company_n.arn
  port              = 8009
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.company_nlbta.arn
  }
}
