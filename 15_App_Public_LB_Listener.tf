resource "aws_lb_listener" "company_albli" {
  load_balancer_arn = aws_alb.company_a.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.company_albta.arn
  }
}
