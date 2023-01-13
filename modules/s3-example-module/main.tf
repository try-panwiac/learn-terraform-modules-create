resource "aws_alb" "enabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = [aws_subnet.main.id]

  access_logs {
    bucket  = var.bucket_name
    enabled = var.enable_access_logs
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
