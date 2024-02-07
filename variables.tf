variable "cross_connect" {
  description = "Cross Connect Input Object"
  type = object({
    compartment_id        = string,
    display_name          = string,
    location_name         = optional(string),
    port_speed_shape_name = string,

    # Optional
    cross_connect_group_id                      = optional(string),
    customer_reference_name                     = optional(string),
    far_cross_connect_or_cross_connect_group_id = optional(string),
    defined_tags                                = optional(map(string)),
    freeform_tags                               = optional(map(string)),
    macsec_properties = optional(list(object({
      # Required
      state = string,

      # Optional
      encryption_cipher              = optional(string),
      is_unprotected_traffic_allowed = optional(bool),
      primary_key = optional(list(object({
        # Required
        connectivity_association_key_secret_id  = string,
        connectivity_association_name_secret_id = string,
      })))
    }))),
    near_cross_connect_or_cross_connect_group_id = optional(string),
    is_active = optional(bool),
  })
  # Validation
  ## port_speed_shape_name
  validation {
    condition     = contains(["1 Gbps", "10 Gbps", "100 Gbps"], var.cross_connect.port_speed_shape_name)
    error_message = "Validation of the Cross Connect object failed. 'port_speed_shape_name' must be one of '1 Gbps', '10 Gbps', '100 Gbps'."
  }
  ## macsec_properties
  ### macsec_properties (check that macsec_properties is not null; check if port_speed_shape_name is 1 Gbps; check that macsec_properties.state is not ENABLED)
  validation {
    condition     = var.cross_connect.macsec_properties != null ? (var.cross_connect.port_speed_shape_name == "1 Gbps" ? (var.cross_connect.macsec_properties[0].state != "ENABLED") : true) : true
    error_message = "Validation of the Cross Connect object failed. The Cross Connect selected port speed for single cross-connects or cross-connect groups must be 10 Gbps or greater to enable MACSec."
  }
  ### state
  validation {
    condition     = var.cross_connect.macsec_properties != null ? (var.cross_connect.macsec_properties[0].state != null ? (contains(["ENABLED", "DISABLED"], var.cross_connect.macsec_properties[0].state)) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.state' must be one of 'ENABLED', 'DISABLED'."
  }
  ### encryption_cipher
  validation {
    condition     = var.cross_connect.macsec_properties != null ? (var.cross_connect.macsec_properties[0].encryption_cipher != null ? contains(["AES128_GCM_XPN", "AES256_GCM_XPN"], var.cross_connect.macsec_properties[0].encryption_cipher) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.encryption_cipher' must be one of 'AES128_GCM_XPN', 'AES256_GCM_XPN'."
  }
  ## is_unprotected_traffic_allowed
  validation {
    condition     = var.cross_connect.macsec_properties != null ? (var.cross_connect.macsec_properties[0].is_unprotected_traffic_allowed != null ? (contains([true, false], var.cross_connect.macsec_properties[0].is_unprotected_traffic_allowed)) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.is_unprotected_traffic_allowed' must be one of 'true', 'false'."
  }
}
