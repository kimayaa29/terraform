resource "aws_s3_bucket" "kimaya_bucket" {
    bucket = "terraform-bucket-kimaya"
    acl = "public-read"

    versioning {
    enabled = true
    }

    lifecycle_rule {
    prefix = "files/"
    enabled = false
    
    noncurrent_version_transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
    }

    tags = {
      Type = "LOG"
      Tier = "STANDARD"
    } 
}

resource "aws_s3_bucket_object" "readme_file" {
    bucket = aws_s3_bucket.kimaya_bucket.bucket
    key = "files/readme.txt"
    source = "readme.txt"
    etag = filemd5("readme.txt")
  
}