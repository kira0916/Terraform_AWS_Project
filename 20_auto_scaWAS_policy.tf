resource "aws_autoscaling_policy" "company_auto_WEB_policy" {
    name = "company-auto-WEB-policy"
    policy_type = "TargetTrackingScaling"
    autoscaling_group_name = aws_autoscaling_group.company_scaling_group.name

    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 30.0
  }
}

resource "aws_autoscaling_policy" "company_auto_WAS_policy" {
    name = "company-auto-WAS-policy"
    policy_type = "TargetTrackingScaling"
    autoscaling_group_name = aws_autoscaling_group.company_scaWAS_group.name

    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 30.0
  }

}