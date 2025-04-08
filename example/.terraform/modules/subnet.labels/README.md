<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform google Labels
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create labels resource on google.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.4-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-google-labels/blob/main/LICENSE">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>



</p>
<p align="center">

<a href='https://www.facebook.com/Slovink.in=https://github.com/slovink/terraform-lables'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/company/101534993/admin/feed/posts/=https://github.com/slovink/terraform-lables'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>



# Terraform-google-labels
# Google Cloud Infrastructure Provisioning with Terraform

This Terraform module is designed to create structured labels for resources with specific attributes.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)
## Introduction

The **"labels"** Terraform module allows you to define and manage labels for your resources in a structured manner. Labels are essential for resource organization and identification, and this module provides an easy way to create and manage them.

## Usage

You can use this module in your Terraform configuration like this:
## Example: labels
```hcl
module "labels" {
  source      = "git::https://github.com/slovink/terraform-google-labels.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
  attributes  = ["private"]
  extra_tags  = {
    Application = "Demo"
  }
}
```
Please ensure you specify the correct 'source' path for the module.

# Examples

For detailed examples on how to use this module, please refer to the [Examples](https://github.com/slovink/terraform-google-labels/tree/master/example) directory within this repository.

# License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/slovink/terraform-google-labels/blob/master/LICENSE) file for more details.

# Author
Your Name
Replace **MIT** and **slovink** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.7.4 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.50, < 5.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`). | `list(string)` | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `organization`, `name`, `environment` and `attributes`. | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'slovink'. | `string` | `"slovink"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/slovink/terraform-google-labels"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attributes"></a> [attributes](#output\_attributes) | Normalized attributes. |
| <a name="output_environment"></a> [environment](#output\_environment) | Normalized environment |
| <a name="output_id"></a> [id](#output\_id) | Disambiguated ID. |
| <a name="output_label_order"></a> [label\_order](#output\_label\_order) | Normalized Tag map. |
| <a name="output_name"></a> [name](#output\_name) | Normalized name. |
| <a name="output_repository"></a> [repository](#output\_repository) | Terraform current module repo |
| <a name="output_tags"></a> [tags](#output\_tags) | Normalized Tag map. |
<!-- END_TF_DOCS -->
