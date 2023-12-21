# Data lookup of additioanl required parameters

## Cross Connect location
data "oci_core_cross_connect_locations" "cross_connect_locations" {
  compartment_id = var.cross_connect.compartment_id
}
