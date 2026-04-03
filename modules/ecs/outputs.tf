output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "asg_name" {
  value = aws_autoscaling_group.ecs_asg.name
}
output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}
output "alb_dns" {
  value = aws_lb.alb.dns_name
}