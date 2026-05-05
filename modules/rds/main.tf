resource "aws_db_subnet_group" "db_subnet_group" {
  name = "${var.project_name}-db-${var.env}-subnet-group"

  subnet_ids = [
    var.private_subnet_id,
    var.private_subnet_id2
  ]

  tags = {
    Name = "DB Subnet Group"
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "${var.project_name}-rds-sg-${var.env}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
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

resource "aws_db_instance" "mysql" {
  identifier        = "${var.project_name}-db-${var.env}"
  engine            = "mysql"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  username = "admin"
  password = "Password123"

  skip_final_snapshot = true
  publicly_accessible = false

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "${var.project_name}-RDS"
  }
}