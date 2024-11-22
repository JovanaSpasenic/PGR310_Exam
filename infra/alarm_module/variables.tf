# Terraform variabel for e-postadresse
variable "email_address" {
  description = "E-postadresse for varsling"
  type        = string
}

variable "sqs_queue_name" {
  description = "Navnet på SQS-køen"
  type        = string
  default     = "image-queue_82" 
}
