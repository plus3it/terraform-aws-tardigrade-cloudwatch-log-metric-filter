# terraform-aws-tardigrade-cloudwatch-log-metric-filter

Terraform module to create CloudWatch Log Metric Filters

# Variable Definitions

As can be seen in the inputs, this module takes the variable `metric_filters`, which is a schema list consisting of the following fields:
* `name` (string) - the name for the metric filter
* `filter_pattern` (string) - CloudWatch Logs filter pattern for extracting metric data out of ingested log events
* `log_group_name` (string) - The name of the log group to associate the metric filter with
* `metric_transformation` (map) - A map defining collection of information needed to define how metric data gets emitted. The metric_transformation map consists of the following fields:
  * `name` (string) - The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount)
  * `namespace` (string) - The destination namespace of the CloudWatch metric.
  * `value` (string) -  What to publish to the metric. For example, if you're counting the occurrences of a particular term like "Error", the value will be "1" for each occurrence. Ifyou're counting the bytes transferred the published value will be the value in the log event.
  * `default_value` (string) - The value to emit when a filter pattern does not match a log event.


<!-- BEGIN TFDOCS -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| create\_metric\_filter | Controls whether to create the metric filter | `bool` | `true` | no |
| metric\_filters | Schema list of metric filters, consisting of name, filter\_pattern, log\_group\_name, and metric\_transformation schema | <pre>list(object({<br>    name           = string<br>    filter_pattern = string<br>    log_group_name = string<br>    metric_transformation = object({<br>      name          = string<br>      namespace     = string<br>      value         = string<br>      default_value = string<br>    })<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| metric\_filters | Maps of name => filter objects |

<!-- END TFDOCS -->
