import {
  to = aws_lambda_function.this
  id = "manual-created-lambda"
}

resource "aws_lambda_function" "this" {
  description                        = "A starter AWS Lambda function."
  filename = null
  function_name                      = "manual-created-lambda"
  handler                            = "index.handler"
  role                               = "arn:aws:iam::819120232235:role/service-role/manual-created-lambda-role-xc611wg8"
  runtime                            = "nodejs18.x"
  source_code_hash                   = null
  tags = {
    "lambda-console:blueprint" = "hello-world"
  }
  
  logging_config {
    log_format            = "Text"
    log_group             = "/aws/lambda/manual-created-lambda"
  }
}