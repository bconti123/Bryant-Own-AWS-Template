
## Create AWS S3 Bucket
resource "aws_s3_bucket" "static-web" {
  bucket = "bryantconti.com"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
      [{
          "Condition": {
              "KeyPrefixEquals": "docs/"
          },
          "Redirect": {
              "ReplaceKeyPrefixWith": "documents/"
          }
      }]
    EOF
  }
}

## CORS RULE
/*  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
} */

## VERSIONING CONTROL
/* versioning {
    enabled = true
  }
} */

## LOGGING
/*  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  } */

## Policy (NEED FIX THIS!)

resource "aws_s3_bucket_policy" "b" { ## See first line, copy and paste this.
  bucket = aws_s3_bucket.b.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::my_tf_test_bucket/*",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}
