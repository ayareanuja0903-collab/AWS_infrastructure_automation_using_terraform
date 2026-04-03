resource "aws_lb" "alb" {
  name               = "my-alb-new"
  load_balancer_type = "application"
  subnets            = var.public_subnets 
  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_security_group" "alb_sg" {
  vpc_id = var.vpc_id  
}