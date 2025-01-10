import {
  to = aws_iam_policy.lambda-policy
  id = "arn:aws:iam::819120232235:policy/service-role/AWSLambdaBasicExecutionRole-44da5458-9c81-431d-9eff-e1a61f238ff2"
}
data "aws_caller_identity" "current" {}

data "aws_region" "current" {

}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    effect    = "Allow"
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"]
    actions   = ["logs:CreateLogGroup"]
  }
  statement {
    effect    = "Allow"
    resources = ["${aws_cloudwatch_log_group.log_group.arn}:*"]
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
  }

}


resource "aws_iam_policy" "lambda-policy" {
  name     = "AWSLambdaBasicExecutionRole-44da5458-9c81-431d-9eff-e1a61f238ff2"
  path     = "/service-role/"
  policy   = data.aws_iam_policy_document.lambda_policy.json
  tags     = {}
  tags_all = {}
}