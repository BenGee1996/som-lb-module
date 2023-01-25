resource "aws_security_group" "som_lb_sg" {

  name   = var.lb_sg_name
  vpc_id = var.vpc_id

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
}