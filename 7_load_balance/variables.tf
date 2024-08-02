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
##
##


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
data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "devops-demo-offerista"
    key    = "terraform/devops-terraform-sg-euc1.tfstate"
    region = "eu-central-1" ## Variables not allowed ## Variables not allowed
  }
}

locals {
  vpc_euc1_id = data.terraform_remote_state.vpc.outputs.VPC_EUC1_ID
  sg_vpn_id   = data.terraform_remote_state.sg.outputs.sg_vpn_id
  sg_cmd_id   = data.terraform_remote_state.sg.outputs.sg_cmd_id

  vpc_sbn_euc1_pub_01_id    = data.terraform_remote_state.sbn.outputs.vpc_sbn_euc1_pub_01_id
  vpc_sbn_euc1_pub_01_cidr  = data.terraform_remote_state.sbn.outputs.vpc_sbn_euc1_pub_01_cidr
  vpc_sbn_euc1_priv_01_id   = data.terraform_remote_state.sbn.outputs.vpc_sbn_euc1_priv_01_id
  vpc_sbn_euc1_priv_01_cidr = data.terraform_remote_state.sbn.outputs.vpc_sbn_euc1_priv_01_cidr

  sg_main_id   = data.terraform_remote_state.sg.outputs.sg_main_id
  sg_80_id     = data.terraform_remote_state.sg.outputs.sg_80_id
  sg_egress_id = data.terraform_remote_state.sg.outputs.sg_egress_id
}
###
