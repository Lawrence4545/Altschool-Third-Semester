resource "aws_instance" "alt-1" {
  ami               = var.ami
  instance_type     = var.type
  key_name          = var.key-pair
  security_groups   = [aws_security_group.alt-sg-rule.id]
  subnet_id         = aws_subnet.alt-pub-subnet1.id
  availability_zone = var.availability_zone["a"]

  connection {
    type        = "ssh"
    host        = "self.public_ip"
    user        = "ubuntu"
    private_key = file("/root/terraform/mini-project.pem")

  }

  tags = {
    Name   = "alt-1"
    source = "terraform"
  }
}

resource "aws_instance" "alt-2" {
  ami               = var.ami
  instance_type     = var.type
  key_name          = var.key-pair
  security_groups   = [aws_security_group.alt-sg-rule.id]
  subnet_id         = aws_subnet.alt-pub-subnet2.id
  availability_zone = var.availability_zone["b"]

  connection {
    type        = "ssh"
    host        = "self.public_ip"
    user        = "ubuntu"
    private_key = file("/root/terraform/mini-project.pem")

  }

  tags = {
    Name   = "alt-2"
    source = "terraform"
  }
}

resource "aws_instance" "alt-3" {
  ami               = var.ami
  instance_type     = var.type
  key_name          = var.key-pair
  security_groups   = [aws_security_group.alt-sg-rule.id]
  subnet_id         = aws_subnet.alt-pub-subnet1.id
  availability_zone = var.availability_zone["a"]

  connection {
    type        = "ssh"
    host        = "self.public_ip"
    user        = "ubuntu"
    private_key = file("/root/terraform/mini-project.pem")

  }

  tags = {
    Name   = "alt-3"
    source = "terraform"
  }
}

resource "local_file" "Ip_address" {
  filename = "/root/terraform/ansible-playbook/host-inventory"
  content  = <<EOT
    ${aws_instance.alt-1.public_ip}
    ${aws_instance.alt-2.public_ip}
    ${aws_instance.alt-3.public_ip}
     EOT
}