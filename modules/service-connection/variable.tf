variable "network_id" {
  description = "network Id"
  type        = string
}
variable "peering_ranges" {
  description = "reserved peering ranges"
  type        = list(string)
}