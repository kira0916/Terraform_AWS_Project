resource "aws_autoscaling_notification" "company_notifications_WAS" {
  group_names = [
    aws_autoscaling_group.company_scaWAS_group.id
  ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.company_topic.arn
}

