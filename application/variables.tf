variable "project_id" {
  type        = string
  description = "The GCP project ID for the Apigee organization"
}

variable "org_type" {
  type        = string
  description = "Apigee organization type: X or hybrid"
  default     = "X"
}

variable "region" {
  type        = string
  description = "Region for analytics"
  default     = "us-central1"
}
variable "apigee_network_name" {
  type = string
}
variable "apigee_global_address_name" {
  type        = string
  description = "apigee global address name"
}