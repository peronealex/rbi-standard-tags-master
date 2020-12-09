# RBI Standard Tags

This module creates a standard set of tags which sould be applied to all resources in Azure. These tags conform to the guidelines outlined in the patterns defined [here](https://gitlab.b2b.regn.net/guides/Azure/blob/master/docs/patterns/tagging_naming_conventions.md)

Parameters are passed into the module, the values are processed inside the module and normalised values are exposed as outputs.

### Outputs

`base_name`
  - A name prefix to be applied to resources

`default_tags`
  - A map of tags which can be added to resources in the resource group
  - These tags include the following information:
    - `market`
    - `subscription`
    - `project`
    - `environment`
    - `product`
    - `location`
    - `terraform` = true
    - `provider` = azure

`market`
  - The RBI market specified in the module inputs

`subscription`
  - The 3 letter name assigned to the subscription

`project`
  - The terraform project identifier specified in the module inputs

`environment`
  - The name of the staging environment (prototype, development, production)

`environment_short`
  - The shortand name of the staging environmnet (proto, dev, prod)

`product`
  - The name of the product as specified in the module inputs

`location`
  - The name of the Azure region resources will be deployed in

### Example

```javascript
module "tags_west_europe" {
  source = "git::https://gitlab.b2b.regn.net/terraform/modules/Azure/rbi-standard-tags.git?ref=v1.1"

  project         = var.project_path
  location        = "West Europe"
  market          = "IOG"
  environment     = "Development"
  product         = "Shared Infrastructure Network"
}

resource "azurerm_virtual_machine" "vm_west_europe" {
  ......
  name                  = "${module.tags_west_europe.base_name}-vm"
  tags = merge(
    module.tags_west_europe.default_tags
    {
      name = "iobewapp001v"
  })
  ......
}
```
