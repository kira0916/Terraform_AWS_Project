resource "aws_placement_group" "company_placement_WASgroup" {
  name     = "company_WASplacement"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "company_scaWAS_group" {
  name                      = "company-scaWAS-group"
  min_size                  = 1
  max_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = false
  launch_configuration      = aws_launch_configuration.company_autowas.name
  vpc_zone_identifier       = [aws_subnet.company_wasa.id, aws_subnet.company_wasc.id]
}
