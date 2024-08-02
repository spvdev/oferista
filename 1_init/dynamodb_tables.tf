#
resource "aws_dynamodb_table" "provisioning" {
  for_each = toset(var.tables_name)

  name             = each.value
  hash_key         = "LockID"
  stream_enabled   = false
  write_capacity   = 5
  read_capacity    = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name             = each.value
    Environment      = "DevOps"
    Product          = var.product_label
    Provider         = "TERRAFORM"
    Attention        = "DO NOT MODIFY OR REMOVE FILES"
  }
}
#