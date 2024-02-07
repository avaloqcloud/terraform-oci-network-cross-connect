resource "oci_core_cross_connect" "this" {
  # Required
  compartment_id        = var.cross_connect.compartment_id
  display_name          = var.cross_connect.display_name
  location_name         = data.oci_core_cross_connect_locations.cross_connect_locations.cross_connect_locations[0].name
  port_speed_shape_name = var.cross_connect.port_speed_shape_name
  # Optional
  cross_connect_group_id                      = var.cross_connect.cross_connect_group_id
  customer_reference_name                     = var.cross_connect.customer_reference_name
  far_cross_connect_or_cross_connect_group_id = var.cross_connect.far_cross_connect_or_cross_connect_group_id
  defined_tags                                = var.cross_connect.defined_tags
  freeform_tags                               = var.cross_connect.freeform_tags
  dynamic "macsec_properties" {
    for_each = (var.cross_connect.macsec_properties != null) ? var.cross_connect.macsec_properties : []
    content {
      state                          = macsec_properties.value.state
      encryption_cipher              = try(macsec_properties.value.encryption_cipher, null)
      is_unprotected_traffic_allowed = try(macsec_properties.value.is_unprotected_traffic_allowed, null)

      dynamic "primary_key" {
        for_each = (macsec_properties.value.primary_key != null) ? macsec_properties.value.primary_key : []
        content {
          connectivity_association_key_secret_id  = primary_key.value.connectivity_association_key_secret_id
          connectivity_association_name_secret_id = primary_key.value.connectivity_association_name_secret_id
        }
      }
    }
  }
  near_cross_connect_or_cross_connect_group_id = var.cross_connect.near_cross_connect_or_cross_connect_group_id
  is_active = var.cross_connect.is_active
}
