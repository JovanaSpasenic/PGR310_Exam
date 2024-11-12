resource "aws_lambda_function" "image_processor" {
  function_name = "image-processor"
  
  s3_bucket = var.s3_bucket_name
  s3_key    = "lambda_sqs.zip" # Her bør ZIP-filen som inneholder lambda-koden være lagret i S3
  
  handler = "lambda_sqs.lambda_handler"
  runtime = "python3.8"
  
  timeout = 120 # TimeOUT= 2 minutter 

  role = aws_iam_role.lambda_role.arn
}


resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_sqs_policy" {
  name        = "lambda-sqs-policy"
  description = "Policy for Lambda to access SQS and S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Effect   = "Allow"
        Resource = aws_sqs_queue.image_queue.arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::pgr301-couch-explorers/*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lambda_sqs_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_sqs_policy.arn
  role       = aws_iam_role.lambda_role.name
}