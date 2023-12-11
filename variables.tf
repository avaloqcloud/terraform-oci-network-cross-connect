variable "cross_connect" {
  description = "Cross connect input object"
  type = object({
    compartment_id        = string,
    display_name          = string,
    location_name         = optional(string),
    port_speed_shape_name = string,

    #Optional
    cross_connect_group_id                      = optional(string),
    customer_reference_name                     = optional(string),
    far_cross_connect_or_cross_connect_group_id = optional(string),
    defined_tags                                = optional(map(string)),
    freeform_tags                               = optional(map(string)),
    macsec_properties = optional(list(object({
      #Required
      state = string,

      #Optional
      encryption_cipher              = optional(string),
      is_unprotected_traffic_allowed = optional(bool),
    #   primary_key = optional(object({
    #     #     #Required
    #         connectivity_association_key_secret_id  = string,
    #         connectivity_association_name_secret_id = string,
    #   }))
    }))),
    near_cross_connect_or_cross_connect_group_id = optional(string),
  })
}
