resource "aws_launch_configuration" "company_autowas" {
  name            = "company-autowas"
  image_id        = "ami-0aef823eb2bb4d4b0"
  instance_type   = "t2.small"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.company_sec.id]
  key_name        = "heeyun"
  user_data       = <<-EOF
                    #! bin/bash
                    sudo su -
                    docker swarm init
                    docker pull heeyoonchai/tomcat:1
                    docker service create --name tomcat -p 8009:8009 --dns=8.8.8.8 --replicas 2 heeyoonchai/tomcat:1
                    EOF
}
