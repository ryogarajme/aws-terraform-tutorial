import {
  to = aws_iam_role.this
  id = "terraform-cloud-automation-admin"
}

import {
  to = aws_iam_role_policy_attachment.this
  id = "${aws_iam_role.this.name}/${data.aws_iam_policy.this.arn}"
}


data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this.arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "${var.hostname}:aud"
      values   = var.client_id_list
    }
    condition {
      test     = "StringLike"
      variable = "${var.hostname}:sub"
      values   = [ for workspace in var.workspace_list : 
        "organization:YSacademy:project:${var.project}:workspace:${workspace}:run_phase:*"]
    }
  }
}


resource "aws_iam_role" "this" {
  name               = "terraform-cloud-automation-admin"
  assume_role_policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy" "this" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "this" {
  role = aws_iam_role.this.name
  policy_arn = data.aws_iam_policy.this.arn
}