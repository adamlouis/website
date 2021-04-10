###############################################################################
# SET UP CLOUD PROVIDERS
###############################################################################

provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "east_1"
}

# ###############################################################################
# # SET UP DOMAINS
# ###############################################################################

data "aws_acm_certificate" "suczewski_com" {
  domain   = "suczewski.com"
  statuses = ["ISSUED"]

  # Cloudfront (API Gateway) requires certificate manager in region us-east-1
  provider = aws.east_1
}

# # ###############################################################################
# # # SET UP CLOUDFRONT / S3 PROXY
# # ###############################################################################

module "traininglib-com-static" {
  source = "./modules/s3-cloudfront-proxy"

  s3_bucket_name         = "suczewski.com"
  domain_name            = "suczewski.com"
  domain_certificate_arn = "${data.aws_acm_certificate.suczewski_com.arn}"
}
