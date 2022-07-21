output "s3_bucket_domain_name" {
  value = aws_s3_bucket.reposcan_test.bucket_domain_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.reposcan_test.id
}
