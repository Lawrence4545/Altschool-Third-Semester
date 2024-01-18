variable "domain-name" {
    default = "thelawrence.xyz"
    type = string
    description = "Domain name"
}

resource "aws_route53_zone" "hosted-zone" {
    name = var.domain-name
    tags = {
      Environment = "dev"
    }
}

resource "aws_route53_record" "site-domain" {
    zone_id = aws_route53_zone.hosted-zone.zone_id
    name = "terraform-test.${var.domain-name}"
    type = "A"
    
    alias {
      name = aws_lb.alt-load-balancer.enable_dns_name
      zone_id = aws_lb.alt-load-balancer.zone_id
      evaluate_target_health = true
    }
}