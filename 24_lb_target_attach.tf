resource "aws_lb_target_group_attachment" "company_lbtaatt" {
  target_group_arn = aws_lb_target_group.company_albta.arn
  target_id        = aws_instance.company_ec2_WEBA.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "company_lbtatt" {
  target_group_arn = aws_lb_target_group.company_albta.arn
  target_id        = aws_instance.company_ec2_WEBC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "company_nlbtaatt" {
  target_group_arn = aws_lb_target_group.company_nlbta.arn
  target_id        = aws_instance.company_ec2_WASA.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "company_nlbtatt" {
  target_group_arn = aws_lb_target_group.company_nlbta.arn
  target_id        = aws_instance.company_ec2_WASC.id
  port             = 8080
}