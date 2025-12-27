resource "aws_s3_bucket" "s3-bucket" {
  bucket = "omkar-tf-test-bucket-01"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "omkar-tf-test-bucket-01"
  key    = "main.tf"
  source = "C:/Users/Asus/OneDrive/Desktop/Terraform/S3/main.tf"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5("path/to/file")
}