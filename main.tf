resource "oci_core_cross_connect" "this" {
  for_each = local.potential_cross_connect
  # Required
  compartment_id        = each.value.compartment_id
  display_name          = each.value.display_name
  location_name         = each.value.location_name
  port_speed_shape_name = each.value.port_speed_shape_name
  # Optional
  cross_connect_group_id                      = each.value.cross_connect_group_id
  customer_reference_name                     = each.value.customer_reference_name
  far_cross_connect_or_cross_connect_group_id = each.value.far_cross_connect_or_cross_connect_group_id
  defined_tags                                = each.value.defined_tags
  freeform_tags                               = each.value.freeform_tags
  dynamic "macsec_properties" {
    for_each = each.value.macsec_properties
    content {
      state                          = macsec_properties.value.state
      # encryption_cipher              = macsec_properties.value.encryption_cipher
      # is_unprotected_traffic_allowed = macsec_properties.value.is_unprotected_traffic_allowed

      # dynamic "primary_key" {
      #   for_each = (macsec_properties.value.primary_key != null) ? macsec_properties.value.pirmary_key : {}
      #   content {
      #     connectivity_association_key_secret_id  = primary_key.value.connectivity_association_key_secret_id
      #     connectivity_association_name_secret_id = primary_key.value.connectivity_association_name_secret_id
      #   }
      # }
    }
  }
}
