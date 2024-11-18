
data "archive_file" "lambda_zip" {
  type = "zip"
  source_file = "lambda_sqs.py"
  output_path = "${path.module}/lambda_sqs.zip"
}


resource "aws_lambda_function" "image_processor" {
  function_name = "image-generation-lambda-82"  # Navn på Lambda-funksjonen

  # Bruker lokal zip-fil laget av null_resource
  filename         = data.archive_file.lambda_zip.output_path
  
  handler          = "lambda_sqs.lambda_handler"
  runtime          = "python3.8"
  timeout          = 30  

  role             = aws_iam_role.lambda_role.arn
  
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  environment {
    variables = {
      S3_BUCKET_NAME = var.s3_bucket_name   
      KANDIDATNUMMER = "82"                 
    }
  }

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
  name        = "lambda-sqs-policy-82"
  description = "Policy for Lambda to access SQS, S3, and CloudWatch Logs"

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
        Resource = aws_sqs_queue.image_queue_82.arn
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::pgr301-couch-explorers/*"
      },
      {
        Action = [
          "logs:CreateLogGroup",  
          "logs:CreateLogStream",
          "logs:PutLogEvents"     
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"  
      },
      {
        Effect = "Allow",
        Action = [
          "bedrock:InvokeModel"
        ],
        Resource = "arn:aws:bedrock:us-east-1::foundation-model/amazon.titan-image-generator-v1"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "lambda_sqs_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_sqs_policy.arn
  role       = aws_iam_role.lambda_role.name
}