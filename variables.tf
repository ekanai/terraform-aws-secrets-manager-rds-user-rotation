variable "secret_name" {
  type        = string
  description = "Secret Name"
}

variable "kms_key_arn" {
  type        = string
  description = "KMS Key ARN"
}

variable "aurora_cluster_name" {
  type        = string
  description = "RDS Cluster Name"
}

variable "writer_endpoint" {
  type        = string
  description = "Writer Endpoint"
}

variable "password" {
  type        = string
  description = "Password"
}

variable "port" {
  type        = number
  description = "Port Number"
}

variable "reader_endpoint" {
  type        = string
  description = "Reader Endpoint"
}

variable "user_name" {
  type        = string
  description = "User Name"
}

variable "rotator_arn" {
  type        = string
  description = "Single User Rotator ARN"
}

variable "rotation_days" {
  type        = number
  description = "Rotation Days"
  default     = 1
}

variable "master_secret_arn" {
  type        = string
  description = "Master User Secret ARN"
}
