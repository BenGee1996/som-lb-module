resource "aws_lb" "som_alb" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.som_lb_sg.id]
  subnets = [
    module.vpc.public_subnets["0"],
    module.vpc.public_subnets["1"]
  ]

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
  vpc_id      = module.vpc.vpc_id
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

resource "aws_security_group" "som_lb_sg" {

  name   = var.lb_sg_name
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port        = 80 # Allowing traffic in from port 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] # Allowing traffic in from all sources
  }

  egress {
    from_port        = 0    # Allowing any incoming port
    to_port          = 0    # Allowing any outgoing port
    protocol         = "-1" # Allowing any outgoing protocol 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] # Allowing traffic out to all IP addresses
  }
  depends_on = [
    module.vpc.igw_id
  ]
}