resource "google_apigee_organization" "organization" {
  analytics_region   = var.region
  project_id         = var.project_id
  authorized_network = var.network_id
}
