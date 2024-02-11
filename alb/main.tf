resource "aws_lb_target_group" "tg" {
  name     = "${var.name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"

  health_check {
    interval            = 30
    path                = "/"
    port                = 80
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}

resource "aws_lb" "alb-example" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.aws_security_group_ids
  subnets = var.subnet_ids
  
  tags = {
    Environment = "${var.name}-alb"
  }
}

resource "aws_lb_listener" "listener-tg" {
  load_balancer_arn = aws_lb.alb-example.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_target_group_attachment" "example" {
  count            = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance_ids[count.index]
  depends_on       = [aws_lb.alb-example]
}