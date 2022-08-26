resource "aws_alb" "company_n" {
  name            = "company-n"
  internal        = true
  subnets         = [aws_subnet.company_wasa.id, aws_subnet.company_wasc.id]
  security_groups = [aws_security_group.company_sec.id]
  tags = {
    "Name" = "company-a"
  }
}
output "dns_name_nlb" {
  value = aws_alb.company_n.dns_name
}
