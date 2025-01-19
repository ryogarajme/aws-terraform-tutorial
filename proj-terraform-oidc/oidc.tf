import {
  to = aws_iam_openid_connect_provider.this
  id = "arn:aws:iam::819120232235:oidc-provider/app.terraform.io"
}

data "tls_certificate" "this" {
  url = "https://${var.hostname}"
}

resource "aws_iam_openid_connect_provider" "this" {
  url             = data.tls_certificate.this.url
  client_id_list  = var.client_id_list
  thumbprint_list = [data.tls_certificate.this.certificates[0].sha1_fingerprint]
  tags = {
    "Name" = "Terraform cloud"
  }
}

