output "target_group_arn"{
    value = aws_lb_target_group.som_tg.arn
}
output "load_balancer_arn"{
    value = aws_lb.som_alb.arn
}