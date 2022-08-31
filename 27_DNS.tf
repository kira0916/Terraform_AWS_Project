resource "aws_route53_record" "www" {
    zone_id = "Z01574752F851EJ3WLONV"
    name = "www.jobspace.monster"
    type = "A"

    alias {
      name = aws_alb.company_a.dns_name
      zone_id = aws_alb.company_a.zone_id
      evaluate_target_health = true
    }
  
}

resource "aws_route53_record" "name" {
    zone_id = "Z01574752F851EJ3WLONV"
    name = "jobspace.monster"
    type = "A"

    alias {
      name = aws_alb.company_a.dns_name
      zone_id = aws_alb.company_a.zone_id
      evaluate_target_health = true
    }
  
}