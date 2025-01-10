import {
  to = aws_lambda_function.this
  id = "manual-created-lambda"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.root}/build/index.mjs"
  output_path = "${path.root}/lambda.zip"
}

resource "aws_lambda_function" "this" {
  description   = "A starter AWS Lambda function."
  filename      = "lambda.zip"
  function_name = "manual-created-lambda"
  handler       = "index.handler"
  #role             = "arn:aws:iam::819120232235:role/service-role/manual-created-lambda-role-xc611wg8"
  role             = aws_iam_role.lambda-role.arn
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  tags = {
    "lambda-console:blueprint" = "hello-world"
  }

  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.log_group.name
  }
}


resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"

}