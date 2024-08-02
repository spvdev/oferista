#
resource "aws_s3_bucket" "devops_demo" {
  bucket = "devops-demo-offerista"
  tags = {
    Name    = "DevOps Demo Bucket"
    Product = var.product_label
    #Created_Time_UTC = timestamp()
    Environment = "DEVOPS"
    Provider    = "TERRAFORM"
    Attention   = "DO NOT MODIFY OR REMOVE FILES"
  }
}
#

resource "aws_s3_bucket_ownership_controls" "devops_demo_acl_ownership" {
  bucket = aws_s3_bucket.devops_demo.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
#
resource "aws_s3_bucket_acl" "devops_demo" {
  bucket = aws_s3_bucket.devops_demo.id
  #acl    = "public-read"
  acl = "private"

  depends_on = [aws_s3_bucket_ownership_controls.devops_demo_acl_ownership]
}
#
resource "aws_s3_bucket_versioning" "devops_demo" {
  bucket = aws_s3_bucket.devops_demo.id
  versioning_configuration {
    status = "Enabled"
  }
}
#
