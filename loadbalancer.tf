resource "aws_lb" "som_alb" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "som_tg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  health_check {
    matcher = "200,301,302"
    path    = "/"

  }
  depends_on = [
    aws_lb.som_alb
  ]
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.som_alb.arn # Referencing our load balancer
  port              = var.listener_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.som_tg.arn # Referencing our target group
  }
}