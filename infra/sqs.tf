resource "aws_sqs_queue" "image_queue" {
  name = var.sqs_queue_name
  
  visibility_timeout_seconds = 30 # Tiden Lambda har på å behandle en melding før den er synlig igjen for andre funksjoner
}

resource "aws_lambda_event_source_mapping" "lambda_sqs_mapping" {
  event_source_arn  = aws_sqs_queue.image_queue.arn
  function_name     = aws_lambda_function.image_processor.arn
  enabled           = true
  batch_size        = 5 # Antall meldinger Lambda kan hente per batch
}
