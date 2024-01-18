resource "aws_security_group" "alt-lb-sg" {
    name = "alt-lb-sg"
    description = "sg for the load balancer"
    vpc_id = aws_vpc.alt_vpc.id

    ingress = {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
    }
  
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alt-sg-rule" {
    name = "allow-ssh-http-https"
    description = "allow SSH, HTTP and HTTPS for inbound traffic"
    vpc_id = aws_vpc.alt_vpc.id

    ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
    security_groups = [aws_security_group.alt-lb-sg.id]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
    security_groups = [aws_security_group.alt-lb-sg.id]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  egress = {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alt-sg-rule"
  }
  
}