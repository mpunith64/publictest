resource "google_service_networking_connection" "service_connection" {
  network                 = var.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = var.peering_ranges
}