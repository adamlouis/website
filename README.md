# website

the code for [suczewski.com](https://suczewski.com)

# what

cloudfront proxy to s3 to host static site

managed by terraform

# how to

- `./scripts/run-local.sh` to run local web server
- `cd terraform; terraform apply` to configure infrastructure
- `./scripts/push-content.sh` to update website content

