terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "alt_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "alt_vpc"
  }
}

resource "aws_internet_gateway" "alt_IG" {
  vpc_id = aws_vpc.alt_vpc.id
  tags = {
    Name = "alt_IG"
  }

}

resource "aws_route_table" "alt-RT-pub" {
  vpc_id = aws_vpc.alt_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alt_IG.id
  }

  tags = {
    Name = "alt-RT-pub"
  }
}

resource "aws_route_table_association" "alt-pub-subnet1-association" {
  subnet_id      = aws_subnet.alt-pub-subnet1.id
  route_table_id = aws_route_table.alt-RT-pub.id
}

resource "aws_route_table_association" "alt-pub-subnet2-association" {
  subnet_id      = aws_subnet.alt-pub-subnet2.id
  route_table_id = aws_route_table.alt-RT-pub.id
}

resource "aws_subnet" "alt-pub-subnet1" {
  vpc_id                  = aws_vpc.alt_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "alt-pub-subnet1"
  }
}

resource "aws_subnet" "alt-pub-subnet2" {
  vpc_id                  = aws_vpc.alt_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "alt-pub-subnet2"
  }
}

resource "aws_network_acl" "alt-network_acl" {
  vpc_id = aws_vpc.alt_vpc.id
  subnet_ids = [
    aws_subnet.alt-pub-subnet1.id,
    aws_subnet.alt-pub-subnet2.id,
  ]

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}