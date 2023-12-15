locals {
  potential_cross_connect = length(data.oci_core_cross_connects.existing_cross_connect.cross_connects) < 1 ? {
    "resource" = {
      # Required
      compartment_id        = var.cross_connect.compartment_id
      display_name          = var.cross_connect.display_name
      location_name         = data.oci_core_cross_connect_locations.cross_connect_location.cross_connect_locations[0].name
      port_speed_shape_name = var.cross_connect.port_speed_shape_name

      # Optional
      cross_connect_group_id                       = var.cross_connect.cross_connect_group_id
      customer_reference_name                      = var.cross_connect.customer_reference_name
      far_cross_connect_or_cross_connect_group_id  = var.cross_connect.far_cross_connect_or_cross_connect_group_id
      defined_tags                                 = var.cross_connect.defined_tags
      freeform_tags                                = var.cross_connect.freeform_tags
      macsec_properties                            = var.cross_connect.macsec_properties
      near_cross_connect_or_cross_connect_group_id = var.cross_connect.near_cross_connect_or_cross_connect_group_id
    }
  } : {}

  prep_existing_cross_connect_output = length(data.oci_core_cross_connects.existing_cross_connect.cross_connects) > 0 ? {
    "resource" = {
      compartment_id                               = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].compartment_id
      cross_connect_group_id                       = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].cross_connect_group_id
      customer_reference_name                      = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].customer_reference_name
      defined_tags                                 = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].defined_tags
      display_name                                 = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].display_name
      far_cross_connect_or_cross_connect_group_id  = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].far_cross_connect_or_cross_connect_group_id
      freeform_tags                                = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].freeform_tags
      id                                           = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].id
      is_active                                    = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].is_active
      location_name                                = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].location_name
      macsec_properties                            = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].macsec_properties
      near_cross_connect_or_cross_connect_group_id = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].near_cross_connect_or_cross_connect_group_id
      oci_logical_device_name                      = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].oci_logical_device_name
      oci_physical_device_name                     = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].oci_physical_device_name
      port_name                                    = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].port_name
      port_speed_shape_name                        = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].port_speed_shape_name
      state                                        = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].state
      time_created                                 = data.oci_core_cross_connects.existing_cross_connect.cross_connects[0].time_created
    }
  } : {}
  output_cross_connect = merge(oci_core_cross_connect.this, local.prep_existing_cross_connect_output)
}
