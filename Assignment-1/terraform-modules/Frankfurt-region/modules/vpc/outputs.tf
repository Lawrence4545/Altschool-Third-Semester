output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "public_ip" {
  value = aws_instance.instance.public_ip
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}


