provider "aws" {
  region = "us-east-1"
}

locals {
  filters = [
    {
      name           = "terraform-cwl-unauthorized-operations"
      filter_pattern = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
      log_group_name = aws_cloudwatch_log_group.this.name
      metric_transformation = {
        name          = "Error Count"
        namespace     = "CIS Benchmarks"
        value         = 1
        default_value = 0
      }
    }
  ]
}

module "create_metric_filter" {
  source         = "../../"
  metric_filters = local.filters
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "tardigrade-cloudwatch-metric-filter-${random_string.id.result}"
  retention_in_days = 1
}

resource "random_string" "id" {
  length  = 8
  upper   = false
  special = false
  number  = false
}
