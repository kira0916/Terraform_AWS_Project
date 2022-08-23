resource "aws_autoscaling_attachment" "company_auto_scaWAS_attach" {
    autoscaling_group_name = aws_autoscaling_group.company_scaWAS_group.id
    lb_target_group_arn = aws_lb_target_group.company_nlbta.arn
}