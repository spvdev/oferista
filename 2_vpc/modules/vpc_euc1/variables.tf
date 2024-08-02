variable "availability_zones_euc1" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}
variable "code_zones_euc1" {
  type    = list(string)
  default = ["a", "b", "c"]
}
variable "vpc_name_euc1" {
  description = "Name of VPC"
  default     = "vpc-euc1"
}
variable "vpc_cidr_euc1" {
  default = "10.200.0.0/16"
}
variable "product_label" {
  default = "offerista"
}
