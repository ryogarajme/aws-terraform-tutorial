import {
  to = aws_cloudwatch_log_group.log_group
  id = "/aws/lambda/manual-created-lambda"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/lambda/manual-created-lambda"
}
