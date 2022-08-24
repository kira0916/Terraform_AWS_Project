resource "aws_ami_from_instance" "company_ami" {
  name               = "company-ami"
  source_instance_id = aws_instance.company_ec2_WEBA.id
  depends_on = [
    aws_db_instance.company_mydb
  ]
  tags = {
    "Name" = "company_ami"
  }
}
