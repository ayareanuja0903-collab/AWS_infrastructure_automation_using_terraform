# -----------------------
# DB Subnet Group
# -----------------------
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "my-db-subnet-group"
  }
}

# -----------------------
# RDS Security Group
# -----------------------
resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = var.vpc_id

  # Allow access ONLY from ECS instances
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ecs_sg_id]   # 👈 passed from ECS module
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# -----------------------
# RDS PostgreSQL Instance
# -----------------------
resource "aws_db_instance" "postgres" {
  identifier        = "my-postgres-db"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "mydb"
  username = "postgres"
  password = "MySecurePassword123!"   # ⚠️ change later (Secrets Manager)

  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az            = true   # ✅ High availability
  publicly_accessible = false  # ✅ private only

  backup_retention_period = 7
  skip_final_snapshot     = true

  tags = {
    Name = "my-postgres-db"
  }
}
