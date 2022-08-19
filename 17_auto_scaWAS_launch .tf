resource "aws_launch_configuration" "hychai_autowas" {
  name            = "hychai-autowas"
  image_id        = "ami-0aef823eb2bb4d4b0"
  instance_type   = "t2.small"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.hychai_sec.id]
  key_name        = "heeyun"
  user_data       = <<-EOF
                    #! bin/bash
                    sudo su -
                    docker swarm join --token SWMTKN-1-62yjl5l99jz5df5o1h871u94m7ynxan2vnfz8xu9xyngqoujaz-29ho71dlywq87vulr56pzszd8 10.0.2.162:2377
                    docker service scale tomcat=6
                    EOF
}
