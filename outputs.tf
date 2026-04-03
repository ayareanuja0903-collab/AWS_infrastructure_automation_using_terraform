output "alb_dns" {
  value = module.ecs.alb_dns
}

output "db_endpoint" {
  value = module.rds.rds_endpoint
}