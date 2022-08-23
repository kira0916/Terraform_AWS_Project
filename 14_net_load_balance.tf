resource "aws_lb" "company_n" {
  name            = "company-n"
  load_balancer_type = "network"
  internal        = true
  subnets         = [aws_subnet.company_wasa.id, aws_subnet.company_wasc.id]
  tags = {
    "Name" = "company-n"
  }
}
output "dns_name_nlb" {
  value = aws_lb.company_n.dns_name
}
