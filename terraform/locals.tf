resource "random_string" "s3_bucket_name_random_val" {
  length  = 4
  special = false
  upper   = false
}

locals {
  bucket_name = "reposcan-test-${random_string.s3_bucket_name_random_val.result}"
}
