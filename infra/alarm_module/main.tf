
# CloudWatch alarm for ApproximateAgeOfOldestMessage
resource "aws_cloudwatch_metric_alarm" "sqs_oldest_message_age_alarm" {
  alarm_name          = "SQS-Oldest-Message-Age-Alarm-82"
  alarm_description   = "Alarm for SQS køen når ApproximateAgeOfOldestMessage blir for høy."
  namespace           = "AWS/SQS"
  metric_name         = "ApproximateAgeOfOldestMessage"
  
  dimensions = {
    QueueName = "image-queue_82"  
  }
  statistic           = "Maximum"
  period              = 60  # hvert minutt --> måling
  evaluation_periods  = 2 # Andre gangen betingelsen oppfyles trigges alarmen
  threshold           = 30  # trigger alarmen hvis den eldste meldingen er 30sekunder 
  comparison_operator = "GreaterThanThreshold"
  alarm_actions       = [aws_sns_topic.sqs_alarm_topic.arn]
  ok_actions          = [aws_sns_topic.sqs_alarm_topic.arn]
}

# SNS topic for varsling
resource "aws_sns_topic" "sqs_alarm_topic" {
  name = "sqs-alarm-topic"
}

# Abonner e-postadressen på SNS-topicen
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.sqs_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.email_address
}