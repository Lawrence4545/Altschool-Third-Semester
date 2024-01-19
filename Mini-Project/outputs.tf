output "vpc_id" {
  value = aws_vpc.alt_vpc.id
}

output "elb_lb_dns_name" {
  value = aws_lb.alt-load-balancer.dns_name
}
