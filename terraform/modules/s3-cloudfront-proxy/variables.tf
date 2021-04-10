# https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#allowed_methods
# https://medium.com/runatlantis/hosting-our-static-site-over-ssl-with-s3-acm-cloudfront-and-terraform-513b799aec0f
variable "s3_bucket_name" {}

variable "domain_name" {}

variable "domain_certificate_arn" {}
