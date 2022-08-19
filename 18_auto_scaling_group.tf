resource "aws_placement_group" "hychai_placement_group" {
  name     = "hychai_placement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hychai_scaling_group" {
  name                      = "hychai-scaling-group"
  min_size                  = 1
  max_size                  = 5
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = false
  launch_configuration      = aws_launch_configuration.hychai_autola.name
  vpc_zone_identifier       = [aws_subnet.hychai_weba.id, aws_subnet.hychai_webc.id]
}
