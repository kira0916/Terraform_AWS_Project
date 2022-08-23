resource "aws_s3_bucket" "jobspacecompanys3" {
  bucket = "jobspacecompanys3"

  tags = {
    Name        = "jobspacecompany"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "jobspacecompany_S3_acl" {
  bucket = aws_s3_bucket.jobspacecompanys3.id
  acl    = "public-read"
}
