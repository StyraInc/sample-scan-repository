data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3_bucket" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }

    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.reposcan_test.arn,
      "${aws_s3_bucket.reposcan_test.arn}/*"
    ]
  }
}
