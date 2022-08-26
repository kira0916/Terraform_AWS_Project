resource "aws_lb_target_group" "company_nlbta" {
  name     = "company-nlbta"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.company_vpc.id
  target_type = "instance"

  stickiness {
    type = "lb_cookie"
    enabled = true
    cookie_duration = 86400
  }

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 3
  }
}

