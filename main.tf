resource "aws_secretsmanager_secret" "secret" {
  name       = var.secret_name
  kms_key_id = var.kms_key_arn

  tags = {
    username = var.user_name
  }
}

locals {
  json = {
    dbClusterIdentifier = var.aurora_cluster_name
    engine              = "mysql"
    host                = var.writer_endpoint
    password            = var.password
    port                = var.port
    reader              = var.reader_endpoint
    username            = var.user_name
  }

  masterarn_json = var.master_secret_arn == "" ? {} : { masterarn = var.master_secret_arn }
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(merge(local.json, local.masterarn_json))
}

resource "aws_secretsmanager_secret_rotation" "root" {
  secret_id           = aws_secretsmanager_secret.secret.id
  rotation_lambda_arn = var.rotator_arn

  rotation_rules {
    automatically_after_days = var.rotation_days
  }
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = aws_secretsmanager_secret.secret.id
}
