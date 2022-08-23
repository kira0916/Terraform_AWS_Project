resource "aws_autoscaling_attachment" "company_auto_scaling_attach" {
    autoscaling_group_name = aws_autoscaling_group.company_scaling_group.id
    lb_target_group_arn = aws_lb_target_group.company_albta.arn  
}