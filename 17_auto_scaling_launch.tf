resource "aws_launch_configuration" "company_autola" {
  name            = "company-autola"
  image_id        = "ami-0fc7ebe2178f1b8d0"
  instance_type   = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.company_sec.id]
  key_name        = "heeyun"
  user_data       = <<-EOF
                    #! bin/bash
                    systemctl start httpd
                    systemctl enable httpd
                    EOF
}
