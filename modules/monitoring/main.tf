resource "aws_cloudwatch_log_group" "vpc_logs" {
  name = "/vpc/flow-logs"
}

resource "aws_iam_role" "flow_logs_role" {
  name = "flowLogsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_flow_log" "vpc_flow" {
  log_destination      = aws_cloudwatch_log_group.vpc_logs.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type         = "ALL"
  vpc_id               = var.vpc_id

  iam_role_arn = aws_iam_role.flow_logs_role.arn
}