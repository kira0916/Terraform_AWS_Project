resource "aws_placement_group" "hychai_placement_WASgroup" {
  name     = "hychai_WASplacement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "hychai_scaWAS_group" {
  name                      = "hychai-scaWAS-group"
  min_size                  = 1
  max_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = false
  launch_configuration      = aws_launch_configuration.hychai_autowas.name
  vpc_zone_identifier       = [aws_subnet.hychai_wasa.id, aws_subnet.hychai_wasc.id]
}
