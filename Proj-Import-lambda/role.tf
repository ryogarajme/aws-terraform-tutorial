import {
  to = aws_iam_role.lambda-role
  id = "manual-created-lambda-role-xc611wg8"
}

data "aws_iam_policy_document" "assume_lambda_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }


}


resource "aws_iam_role" "lambda-role" {
  assume_role_policy   = data.aws_iam_policy_document.assume_lambda_role.json
  max_session_duration = 3600
  name                 = "manual-created-lambda-role-xc611wg8"
  path                 = "/service-role/"
}

resource "aws_iam_role_policy_attachment" "policy-attachment" {
  role       = aws_iam_role.lambda-role.name
  policy_arn = aws_iam_policy.lambda-policy.arn
}