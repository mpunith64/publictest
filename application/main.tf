resource "google_project_service" "enable_gke_api" {
  project            = var.project_id
  service            = "compute.googleapis.com"
}

module "apigee_network" {
  source       = "../modules/compute-network"
  network_name = var.apigee_network_name
}

module "apigee_global_address" {
  source        = "../modules/global-address"
  name          = var.apigee_global_address_name
  network_id    = module.apigee_network.id
  prefix_length = 16
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  depends_on    = [module.apigee_network]
}

module "apigee_network_connection" {
  source         = "../modules/service-connection"
  peering_ranges = [module.apigee_global_address.name]
  network_id     = module.apigee_network.id
  depends_on     = [module.apigee_network, module.apigee_global_address]
}

module "apigee_org" {
  source     = "../modules/organization"
  region     = var.region
  project_id = var.project_id
  network_id = module.apigee_network.id
  depends_on = [module.apigee_network_connection]
}