resource "aws_ami_from_instance" "hychai_ami" {
  name               = "hychai-ami"
  source_instance_id = aws_instance.hychai_ec2_WEBA.id
  depends_on = [
    aws_instance.hychai_ec2_WEBA
  ]
  tags = {
    "Name" = "hychai_ami"
  }
}
