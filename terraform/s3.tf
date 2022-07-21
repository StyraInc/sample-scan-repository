resource "aws_s3_bucket" "reposcan_test" {
  bucket = local.bucket_name

  tags = {
    Project = "reposcan"
  }
}

resource "aws_s3_bucket_acl" "reposcan_test" {
  bucket = aws_s3_bucket.reposcan_test.id
  acl    = "public-read-write"
}

resource "aws_s3_bucket_policy" "reposcan_test" {
  bucket = aws_s3_bucket.reposcan_test.id
  policy = data.aws_iam_policy_document.s3_bucket.json
}
