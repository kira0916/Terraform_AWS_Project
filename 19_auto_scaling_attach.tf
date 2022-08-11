resource "aws_autoscaling_attachment" "hychai_auto_scaling_attach" {
    autoscaling_group_name = aws_autoscaling_group.hychai_scaling_group.id
    lb_target_group_arn = aws_lb_target_group.hychai_albta.arn  
}