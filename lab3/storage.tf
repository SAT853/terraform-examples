resource "aws_s3_bucket" "learntf-bins" {
    acl = "public-read"
  
}

output "bucker_url" {
  value = "${aws_s3_bucket.learntf-bins.bucket_domain_name}"
}