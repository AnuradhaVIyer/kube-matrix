locals {
  name_prefix = "${var.project}-db-${var.environment}"
}

resource "aws_db_subnet_group" "this" {
  name       = "${local.name_prefix}-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = merge(var.tags, {
    Name = "${local.name_prefix}-subnet-group"
  })
}

resource "aws_security_group" "db" {
  name        = "${var.project}-sg-db-${var.environment}"
  description = "Security group for Aurora database"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.project}-sg-db-${var.environment}"
  })
}

resource "aws_security_group_rule" "db_ingress_mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = var.db_allowed_cidr_blocks
  security_group_id = aws_security_group.db.id
}

resource "aws_ssm_parameter" "db_username" {
  name        = "/${var.project}/${var.environment}/db/username"
  description = "Aurora master username"
  type        = "String"
  value       = var.db_master_username

  tags = merge(var.tags, {
    Name = "${local.name_prefix}-username"
  })
}

resource "aws_ssm_parameter" "db_password" {
  name        = "/${var.project}/${var.environment}/db/password"
  description = "Aurora master password"
  type        = "SecureString"
  value       = var.db_master_password

  tags = merge(var.tags, {
    Name = "${local.name_prefix}-password"
  })
}

resource "aws_rds_cluster" "this" {
  cluster_identifier      = "${var.project}-db-${var.environment}"
  engine                  = "aurora-mysql"
  engine_version          = var.aurora_engine_version
  database_name           = var.db_name
  master_username         = var.db_master_username
  master_password         = var.db_master_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.db.id]
  backup_retention_period = var.backup_retention_days
  storage_encrypted       = true
  skip_final_snapshot     = var.skip_final_snapshot

  serverlessv2_scaling_configuration {
    min_capacity = var.serverless_v2_min_capacity
    max_capacity = var.serverless_v2_max_capacity
  }

  tags = merge(var.tags, {
    Name = "${var.project}-db-${var.environment}"
  })

  depends_on = [aws_db_subnet_group.this]
}

resource "aws_rds_cluster_instance" "this" {
  identifier         = "${var.project}-db-${var.environment}-instance-1"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.this.engine
  engine_version     = aws_rds_cluster.this.engine_version

  tags = merge(var.tags, {
    Name = "${var.project}-db-${var.environment}-instance-1"
  })
}

resource "aws_ssm_parameter" "db_endpoint" {
  name        = "/${var.project}/${var.environment}/db/endpoint"
  description = "Aurora cluster endpoint"
  type        = "String"
  value       = aws_rds_cluster.this.endpoint

  tags = merge(var.tags, {
    Name = "${local.name_prefix}-endpoint"
  })
}

