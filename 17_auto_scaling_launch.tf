resource "aws_launch_configuration" "hychai_autola" {
  name            = "hychai-autola"
  image_id        = aws_ami_from_instance.hychai_ami.id
  instance_type   = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.hychai_sec.id]
  key_name        = "heeyun"
  user_data       = <<-EOF
                    #! bin/bash
                    systemctl start httpd
                    systemctl enable httpd
                    EOF
}
