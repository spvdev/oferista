#
variable "aws_region" {
  default = "eu-central-1"
}
#
variable "product_label" {
  default = "offerista"
}
variable "code_zones_euc1" {
  type    = list(string)
  default = ["a", "b", "c"]
}
variable "availability_zones_euc1" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

### LOCALS ###
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "devops-demo-offerista"
    key    = "terraform/devops-terraform-vpc-euc1.tfstate"
    region = "eu-central-1" ## Variables not allowed ## Variables not allowed
  }
}
data "terraform_remote_state" "sbn" {
  backend = "s3"
  config = {
    bucket = "devops-demo-offerista"
    key    = "terraform/devops-terraform-sbn-euc1.tfstate"
    region = "eu-central-1" ## Variables not allowed ## Variables not allowed
  }
}
data "terraform_remote_state" "gw" {
  backend = "s3"
  config = {
    bucket = "devops-demo-offerista"
    key    = "terraform/devops-terraform-gw-euc1.tfstate"
    region = "eu-central-1" ## Variables not allowed ## Variables not allowed
  }
}
locals {
  vpc_euc1_id                  = data.terraform_remote_state.vpc.outputs.VPC_EUC1_ID
  vpc_euc1_cidr                = data.terraform_remote_state.vpc.outputs.VPC_EUC1_CIDR
  vpc_euc1_ipv4_sbn_pub_id     = data.terraform_remote_state.sbn.outputs.vpc_sbn_euc1_pub_01_id
  vpc_euc1_ipv4_sbn_priv_01_id = data.terraform_remote_state.sbn.outputs.vpc_sbn_euc1_priv_01_id
  aws_igw_euc1_id              = data.terraform_remote_state.gw.outputs.aws_internet_gateway_ig_euc1_id
  nat_gw_euc1_id               = data.terraform_remote_state.gw.outputs.nat_gw_euc1_id
}
###
