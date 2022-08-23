resource "aws_sns_topic_subscription" "company_topic_sub" {
  topic_arn = aws_sns_topic.company_topic.arn
  protocol  = "email"
  endpoint  = "heeyunchai@naver.com"
}