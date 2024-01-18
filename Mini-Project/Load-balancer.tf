resource "aws_LB" "alt-lb" {
    Name = "alt-lb"
    internet = false
    lb_type = "application"
    security_groups = [aws_security_group.alt-lb_sg.id]
    subnets = [aws_subnet.alt-pub-subnet1.id, aws_subnet.alt-pub-subnet2.id]
    enable_deletion_protection = false
    depends_on = [ aws_instance.alt-1, aws_instance.alt-2, aws_instance.alt-3 ]
}

resource "aws_lb_target_group" "alt-tg" {
    name = "alt-tg"
    target_type = "instance"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.alt_vpc.id

    health_check {
      path = "/"
      protocol = "HTTP"
      matcher = "200"
      interval = 15
      timeout = 3
      healthy_threshold = 3
      unhealthy_threshold = 3
    } 
}

resource "aws_lb_listener" "alt-listener" {
    load_balancer_arn = aws_lb.alt-load-balancer.arn
    port = "80"
    protocol = "HTTP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alt-tg.arn
    }
}

resource "aws_lb_listener_rule" "alt-listener-rule" {
    listener_arn = aws_lb_listener.alt-listener.arn
    priority = 1

    action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alt-tg.arn
    }
  
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

resource "aws_lb_target_group_attachment" "alt-tg-attachment1" {
    target_group_arn = aws_lb_target_group.alt-tg.arn
    target_id = aws_instance.alt-1.id
    port = 80
}

resource "aws_lb_target_group_attachment" "alt-tg-attachment2" {
    target_group_arn = aws_lb_target_group.alt-tg.arn
    target_id = aws_instance.alt-2.id
    port = 80
}

resource "aws_lb_target_group_attachment" "alt-tg-attachment3" {
    target_group_arn = aws_lb_target_group.alt-tg.arn
    target_id = aws_instance.alt-3.id
    port = 80
}