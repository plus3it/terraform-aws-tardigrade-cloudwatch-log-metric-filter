provider "aws" {
  region = "us-east-1"
}

module "nometric_filter" {
  source               = "../../"
  create_metric_filter = false
}
