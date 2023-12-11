# Terraform OCI Core Cross Connect
The code provides a reusable and standalone Terraform module that provisions a Cross Connect on Oracle Cloud Infrastructure.


>⚠️**CAUTION:** Usage of this module assumes no reliance on existing Terraform/ORM state, apply on existing terraform state will remove existng `Cross Connects` resource if managed in state. ⚠️


## Example Input
`cross_connect.auto.tfvars.json`:
```json
{
  "cross_connect": {
    "compartment_id": "ocid1.vault.oc1.eu-frankfurt-1.x",
    "display_name": "my-cross-connect-1",
    "port_speed_shape_name": "10 Gbps",
  }
}
```
