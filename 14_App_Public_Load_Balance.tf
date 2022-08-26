resource "aws_alb" "company_a" {
  name            = "company-a"
  internal        = false
  subnets         = [aws_subnet.company_weba.id, aws_subnet.company_webc.id]
  security_groups = [aws_security_group.company_sec.id]
  tags = {
    "Name" = "company-a"
  }
}
output "dns_name" {
  value = aws_alb.company_a.dns_name
}
