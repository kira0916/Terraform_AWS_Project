resource "aws_placement_group" "company_placement_group" {
  name     = "company_placement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "company_scaling_group" {
  name                      = "company-scaling-group"
  min_size                  = 1
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = false
  launch_configuration      = aws_launch_configuration.company_autola.name
  vpc_zone_identifier       = [aws_subnet.company_weba.id, aws_subnet.company_webc.id]
}
