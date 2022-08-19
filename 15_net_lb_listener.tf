resource "aws_lb_listener" "hychai_nlbli" {
  load_balancer_arn = aws_lb.hychai_nlb.arn
  port              = 8009
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hychai_nlbta.arn
  }
}
