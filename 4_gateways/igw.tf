
## Internet gateway VPC_EUC1
resource "aws_internet_gateway" "igw_euc1" {
  vpc_id = local.vpc_euc1_id

  tags = {
    Name        = "igw_euc1"
    Product     = var.product_label
    Provider    = "TERRAFORM"
    Environment = "EUC1"
  }
}
#
