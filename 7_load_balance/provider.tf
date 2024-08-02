terraform {
  required_version = "<= 1.5.7"
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "devops-demo-offerista"
    key            = "terraform/devops-terraform-lb-euc1.tfstate"
    region         = "eu-central-1" ## Variables not allowed
    dynamodb_table = "terraform-offerista-lb-euc1"
  }
}
