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
    key    = "terraform/devops-terraform-vpc-euc1.tfstate" ## Import variables from VPC Output
    region = "eu-central-1"                                ## Variables not allowed ## Variables not allowed
  }
}
locals {
  #
  vpc_euc1_id                   = data.terraform_remote_state.vpc.outputs.VPC_EUC1_ID
  vpc_euc1_ipv4_sbn_pub_cidr    = data.terraform_remote_state.vpc.outputs.VPC_EUC1_IPV4_SBN_PUB_CIDR
  vpc_euc1_ipv4_sbn_priv01_cidr = data.terraform_remote_state.vpc.outputs.VPC_EUC1_IPV4_SBN_PRIV01_CIDR
  vpc_euc1_ipv4_sbn_priv02_cidr = data.terraform_remote_state.vpc.outputs.VPC_EUC1_IPV4_SBN_PRIV02_CIDR
}
###
