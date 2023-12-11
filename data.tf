# Data lookup of existing resources

## Cross Connect
data "oci_core_cross_connects" "existing_cross_connect" {
  # Required
  compartment_id = var.cross_connect.compartment_id
  display_name   = var.cross_connect.display_name
  state          = "PROVISIONED" #TODO: Check when state exists
}


# Data lookup of additioanl required parameters

## Cross Connect location
data "oci_core_cross_connect_locations" "cross_connect_location" {
  compartment_id = var.cross_connect.compartment_id
}
