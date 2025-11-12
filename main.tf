variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key for integration."
  sensitive   = true
}

module "datadog-integration" {
  source                    = "./gcp-datadog-module"
  project_id                = "opstables"
  dataflow_job_name         = "dfj-push-logs-to-datadog"
  dataflow_temp_bucket_name = "bkt-push-logs-to-datadog-temp"
  topic_name                = "datadog-export-topic"
  subscription_name         = "datadog-export-sub"
  vpc_name                  = "default"
  subnet_name               = "default"
  subnet_region             = "australia-southeast1"
  datadog_api_key           = var.datadog_api_key
  datadog_site_url          = "https://http-intake.logs.ap2.datadoghq.com"
}
