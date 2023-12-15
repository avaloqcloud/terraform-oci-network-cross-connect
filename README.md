# Terraform OCI Core Cross Connect
The code provides a reusable and standalone Terraform module that provisions a Cross Connect on Oracle Cloud Infrastructure.


>⚠️**CAUTION:** Usage of this module assumes no reliance on existing Terraform/ORM state, apply on existing terraform state will remove existng `Cross Connects` resource if managed in state. ⚠️


## Example Input
`cross_connect.auto.tfvars.json`:
```json
{
  "cross_connect": {
    "compartment_id": "ocid1.compartment.oc1",
    "display_name": "my-cross-connect-1",
    "port_speed_shape_name": "10 Gbps",
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.9 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_cross_connect.this](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/resources/core_cross_connect) | resource |
| [oci_core_cross_connect_locations.cross_connect_location](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/data-sources/core_cross_connect_locations) | data source |
| [oci_core_cross_connects.existing_cross_connect](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/data-sources/core_cross_connects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cross_connect"></a> [cross\_connect](#input\_cross\_connect) | Cross Connect input object | <pre>object({<br>    compartment_id        = string,<br>    display_name          = string,<br>    location_name         = optional(string),<br>    port_speed_shape_name = string,<br><br>    # Optional<br>    cross_connect_group_id                      = optional(string),<br>    customer_reference_name                     = optional(string),<br>    far_cross_connect_or_cross_connect_group_id = optional(string),<br>    defined_tags                                = optional(map(string)),<br>    freeform_tags                               = optional(map(string)),<br>    macsec_properties = optional(list(object({<br>      # Required<br>      state = string,<br><br>      # Optional<br>      encryption_cipher              = optional(string),<br>      is_unprotected_traffic_allowed = optional(bool),<br>      primary_key = optional(list(object({<br>        # Required<br>        connectivity_association_key_secret_id  = string,<br>        connectivity_association_name_secret_id = string,<br>      })))<br>    }))),<br>    near_cross_connect_or_cross_connect_group_id = optional(string),<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cross_connect"></a> [cross\_connect](#output\_cross\_connect) | Cross Connect output object |
<!-- END_TF_DOCS -->