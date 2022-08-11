resource "aws_lb_target_group_attachment" "hychai_lbtaatt" {
  target_group_arn = aws_lb_target_group.hychai_albta.arn
  target_id        = aws_instance.hychai_ec2_WEBA.id
  port             = 80

}

resource "aws_lb_target_group_attachment" "hychai_lbtatt" {
  target_group_arn = aws_lb_target_group.hychai_albta.arn
  target_id        = aws_instance.hychai_ec2_WEBC.id
  port             = 80

}