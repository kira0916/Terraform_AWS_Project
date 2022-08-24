resource "aws_launch_configuration" "company_autowas" {
  name            = "company-autowas"
  image_id        = "ami-066d41d96fc160063"
  instance_type   = "t2.small"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.company_sec.id]
  key_name        = "heeyun"
  user_data       = <<-EOF
                    #! bin/bash
                    sudo su -
                    amazon-linux-extras install docker -y
                    amazon-linux-extras enable docker
                    systemctl enable docker
                    systemctl start docker
                    docker swarm init
                    docker pull heeyoonchai/tomcat:5
                    docker service create --name tomcat -p 8080:8080 --dns=8.8.8.8 --replicas 1 heeyoonchai/tom:5
                    EOF
}
