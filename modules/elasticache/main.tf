resource "aws_elasticache_subnet_group" "subnet_group" {
  name = "${var.project_name}-db-${var.env}-subnet-group"

  subnet_ids = [
    var.private_subnet_id,
    var.private_subnet_id2
  ]

  tags = {
    Name = "elasticache Subnet Group"
  }
}

resource "aws_security_group" "sg" {
  name   = "${var.project_name}-elasticache-sg-${var.env}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${var.project_name}-redis-${var.env}"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.subnet_group.name
  security_group_ids   = [aws_security_group.sg.id]
}