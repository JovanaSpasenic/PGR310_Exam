
# S3 Bucket Name for Lambda function and storage
variable "s3_bucket_name" {
  description = "S3 bucket name for Lambda deployment and storage"
  type        = string
  default     = "pgr301-couch-explorers"
}


# SQS Queue Name
variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  type        = string
  default     = "image-queue_82"
}


# IAM Role Name for Lambda
variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda"
  type        = string
  default     = "lambda-sqs-role"
}
