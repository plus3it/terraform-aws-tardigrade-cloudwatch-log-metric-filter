provider "aws" {
  region = "us-east-1"
}

locals {
  filters = [
    {
      name           = "terraform-cwl-unauthorized-operations"
      filter_pattern = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
      log_group_name = "/aws/cloudtrail/tardigrade-dev-cloudtrail"
      metric_transformation = {
        name          = "Error Count"
        namespace     = "CIS Benchmarks"
        value         = 1
        default_value = 0
      }
    }
  ]
}

