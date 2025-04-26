resource "google_compute_global_address" "address_range" {
  name          = var.name
  purpose       = var.purpose
  address_type  = var.address_type
  prefix_length = var.prefix_length
  network       = var.network_id
}