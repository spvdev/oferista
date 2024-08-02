#Routing table for public subnets VPC MGMT
resource "aws_route_table" "rtb_euc1_pub" {
  vpc_id = local.vpc_euc1_id

  route { ## default gateway
    cidr_block = "0.0.0.0/0"
    gateway_id = local.aws_igw_euc1_id
  }

  tags = {
    Name     = "rtb_euc1_pub"
    Product  = var.product_label
    Provider = "TERRAFORM"
    Environment = "EUC1"
  }
}

##
resource "aws_route_table" "rtb_euc1_priv_a" {
  vpc_id = local.vpc_euc1_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.nat_gw_euc1_id[0]
  }

  tags = {
    Name    = "rtb_euc1_priv_a"
    Product = var.product_label
    Provider = "TERRAFORM"
    Environment = "EUC1"
  }
}
##
resource "aws_route_table" "rtb_euc1_priv_b" {
  vpc_id = local.vpc_euc1_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.nat_gw_euc1_id[1]
  }

  tags = {
    Name    = "rtb_euc1_priv_b"
    Product = var.product_label
    Provider = "TERRAFORM"
    Environment = "EUC1"
  }
}
##
resource "aws_route_table" "rtb_euc1_priv_c" {
  vpc_id = local.vpc_euc1_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = local.nat_gw_euc1_id[2]
  }

  tags = {
    Name    = "rtb_euc1_priv_c"
    Product = var.product_label
    Provider = "TERRAFORM"
    Environment = "EUC1"
  }
}
###
