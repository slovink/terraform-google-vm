<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform google vm
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create vm resource on google.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.7.4-green" alt="Terraform">
</a>
<a href="https://github.com/slovink/terraform-google-vm/blob/main/LICENSE">
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

# Terraform-google-vm
# Terraform Google Cloud VM Module
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)
- [Author](#author)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This project deploys a Google Cloud infrastructure using Terraform to create a VPC, subnets, firewall rules, and compute instances.

## Usage
This section configures a compute instance. It specifies the name, environment, project, instance tags, machine type, GCP zone, service account scopes, subnetwork (retrieved from the subnet module), and SSH keys for access.
## Example: compute_instance
```hcl
module "compute_instance" {
  source                 = "../"
  name                   = "ops"
  environment            = "test"
  instance_count         = 1
  instance_tags          = ["foo", "bar"]
  machine_type           = "e2-small"
  image                  = "ubuntu-2204-jammy-v20230908"
  gcp_zone               = "asia-northeast1-a"
  service_account_scopes = ["cloud-platform"]
  subnetwork             = module.subnet.subnet_id

  # Enable public IP only if enable_public_ip is true
  enable_public_ip = true
  metadata = {
    ssh-keys = <<EOF
      test:ssh-rsa AAAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxbLLNM= bittu@hp
    EOF
  }
}

```
You can customize the input variables according to your specific requirements.

## Examples
For detailed examples on how to use this module, please refer to the [Examples](https://github.com/slovink/terraform-google-vm/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **slovink** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/slovink/terraform-google-vm/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.9.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=6.1.0|

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >=6.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | git::git@github.com:slovink/terraform-google-labels.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_client_config.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerator_count"></a> [accelerator\_count](#input\_accelerator\_count) | Count of GPU accelerators | `number` | `1` | no |
| <a name="input_accelerator_type"></a> [accelerator\_type](#input\_accelerator\_type) | Type of GPU accelerator | `string` | `"nvidia-tesla-k80"` | no |
| <a name="input_allow_stopping_for_update"></a> [allow\_stopping\_for\_update](#input\_allow\_stopping\_for\_update) | must be set to true or your instance must have a desired\_status of TERMINATED in order to update this field. | `bool` | `true` | no |
| <a name="input_auto_delete"></a> [auto\_delete](#input\_auto\_delete) | Determines whether the disk should be auto-deleted when the instance is deleted. | `bool` | `true` | no |
| <a name="input_boot_disk_size"></a> [boot\_disk\_size](#input\_boot\_disk\_size) | Boot disk size in GB | `number` | `20` | no |
| <a name="input_boot_disk_type"></a> [boot\_disk\_type](#input\_boot\_disk\_type) | Boot disk type | `string` | `""` | no |
| <a name="input_can_ip_forward"></a> [can\_ip\_forward](#input\_can\_ip\_forward) | Allow IP forwarding | `bool` | `false` | no |
| <a name="input_create_instances"></a> [create\_instances](#input\_create\_instances) | Toggle to determine whether instances should be created or not. Set to 'true' to create instances, 'false' to skip instance creation. | `bool` | `true` | no |
| <a name="input_custom_hostname"></a> [custom\_hostname](#input\_custom\_hostname) | Custom hostname for the VM instance (RFC-1035 compliant) | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the instance | `string` | `"VM instance created with Terraform"` | no |
| <a name="input_desired_status"></a> [desired\_status](#input\_desired\_status) | Specifies the desired status for the resource. Default is RUNNING. | `string` | `"RUNNING"` | no |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | Specifies the name of the device, typically for the boot disk. | `string` | `"boot-disk"` | no |
| <a name="input_enable_accelerator"></a> [enable\_accelerator](#input\_enable\_accelerator) | Enable GPU accelerator | `bool` | `false` | no |
| <a name="input_enable_alias_ip_range"></a> [enable\_alias\_ip\_range](#input\_enable\_alias\_ip\_range) | Enable alias IP range | `bool` | `false` | no |
| <a name="input_enable_confidential_compute"></a> [enable\_confidential\_compute](#input\_enable\_confidential\_compute) | Determines whether confidential compute should be enabled for the resource. Default is false. | `bool` | `false` | no |
| <a name="input_enable_display"></a> [enable\_display](#input\_enable\_display) | Enable display for the instance | `bool` | `false` | no |
| <a name="input_enable_ipv6"></a> [enable\_ipv6](#input\_enable\_ipv6) | Enable IPv6 access configuration | `bool` | `false` | no |
| <a name="input_enable_network_performance_config"></a> [enable\_network\_performance\_config](#input\_enable\_network\_performance\_config) | Enable network performance configuration | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Predefined enable\_public\_ip  address for the instance. | `bool` | `false` | no |
| <a name="input_enable_service_account"></a> [enable\_service\_account](#input\_enable\_service\_account) | Enable or disable the service account for the instance | `bool` | `false` | no |
| <a name="input_enable_shielded_instance_config"></a> [enable\_shielded\_instance\_config](#input\_enable\_shielded\_instance\_config) | Enable shielded instance config | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_external_ipv6"></a> [external\_ipv6](#input\_external\_ipv6) | External IPv6 address | `string` | `""` | no |
| <a name="input_image"></a> [image](#input\_image) | Source image family. If neither source\_image nor source\_image\_family is specified, defaults to the latest public CentOS image. | `string` | `"ubuntu-2204-jammy-v20230908"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | The number of instances to create. | `number` | `1` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | Network tags, provided as a list | `list(string)` | `[]` | no |
| <a name="input_interface"></a> [interface](#input\_interface) | Specifies the type of interface for the disk, such as NVME or SCSI. | `string` | `"NVME"` | no |
| <a name="input_ip_cidr_range"></a> [ip\_cidr\_range](#input\_ip\_cidr\_range) | The primary IP CIDR range for the subnetwork. | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to assign to the resource, such as environment or other metadata. | `map(string)` | <pre>{<br>  "environment": "production"<br>}</pre> | no |
| <a name="input_local_disks"></a> [local\_disks](#input\_local\_disks) | Flag to determine if scratch disk should be created | `bool` | `false` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Machine type to create, e.g. n1-standard-1 | `string` | `""` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, e.g. 'slovink.com'. | `string` | `"slovink.com"` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metadata, provided as a map | `map(string)` | `{}` | no |
| <a name="input_metadata_startup_script"></a> [metadata\_startup\_script](#input\_metadata\_startup\_script) | User startup script to run when instances spin up | `string` | `""` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Specifies the access mode for the device. Options are READ\_WRITE or READ\_ONLY. | `string` | `"READ_WRITE"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource. Provided by the client when the resource is created. | `string` | `""` | no |
| <a name="input_name_IPv6"></a> [name\_IPv6](#input\_name\_IPv6) | Specifies the name for the network interface or IP configuration. | `string` | `"External IPv6"` | no |
| <a name="input_nat_ip"></a> [nat\_ip](#input\_nat\_ip) | NAT IP address for public access | `string` | `""` | no |
| <a name="input_network"></a> [network](#input\_network) | Subnet to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| <a name="input_network_tier"></a> [network\_tier](#input\_network\_tier) | Network tier for the public IP | `string` | `"STANDARD"` | no |
| <a name="input_network_tier_IPv6"></a> [network\_tier\_IPv6](#input\_network\_tier\_IPv6) | Specifies the network tier for the interface. Options are PREMIUM or STANDARD. | `string` | `"STANDARD"` | no |
| <a name="input_nic_type"></a> [nic\_type](#input\_nic\_type) | Specifies the network interface card (NIC) type, such as GVNIC or VIRTIO. | `string` | `"GVNIC"` | no |
| <a name="input_public_ptr_domain_name"></a> [public\_ptr\_domain\_name](#input\_public\_ptr\_domain\_name) | Public PTR domain name for the instance | `string` | `""` | no |
| <a name="input_queue_count"></a> [queue\_count](#input\_queue\_count) | Specifies the number of queues for the NIC. Default is 1. | `number` | `1` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/slovink/terraform-google-vm"` | no |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | Service account email | `string` | `""` | no |
| <a name="input_service_account_scopes"></a> [service\_account\_scopes](#input\_service\_account\_scopes) | Service account scopes | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/cloud-platform"<br>]</pre> | no |
| <a name="input_shielded_instance_config"></a> [shielded\_instance\_config](#input\_shielded\_instance\_config) | Shielded instance configuration options | `map(bool)` | <pre>{<br>  "enable_integrity_monitoring": true,<br>  "enable_secure_boot": false,<br>  "enable_vtpm": true<br>}</pre> | no |
| <a name="input_stack_type"></a> [stack\_type](#input\_stack\_type) | Specifies the IP stack type for the instance, such as IPV4\_ONLY or IPV4\_IPV6. | `string` | `"IPV4_ONLY"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | Subnet to deploy to. Only one of network or subnetwork should be specified. | `string` | `""` | no |
| <a name="input_subnetwork_range_name"></a> [subnetwork\_range\_name](#input\_subnetwork\_range\_name) | The name of the secondary IP range for the subnetwork. | `string` | `""` | no |
| <a name="input_total_egress_bandwidth_tier"></a> [total\_egress\_bandwidth\_tier](#input\_total\_egress\_bandwidth\_tier) | Egress bandwidth tier | `string` | `"STANDARD"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The GCP zone to create resources in | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cpu_platform"></a> [cpu\_platform](#output\_cpu\_platform) | The CPU platform used by this instance. |
| <a name="output_current_status"></a> [current\_status](#output\_current\_status) | The current status of the instance. |
| <a name="output_instance_count"></a> [instance\_count](#output\_instance\_count) | The value of the instance\_count variable. |
| <a name="output_instance_count_output"></a> [instance\_count\_output](#output\_instance\_count\_output) | The value of the instance\_count variable. |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The server-assigned unique identifier of this instance. |
| <a name="output_label_fingerprint"></a> [label\_fingerprint](#output\_label\_fingerprint) | The unique fingerprint of the labels. |
| <a name="output_metadata_fingerprint"></a> [metadata\_fingerprint](#output\_metadata\_fingerprint) | The unique fingerprint of the metadata. |
| <a name="output_name"></a> [name](#output\_name) | The name  of the instance. |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The URI of the created resource. |
| <a name="output_tags_fingerprint"></a> [tags\_fingerprint](#output\_tags\_fingerprint) | The unique fingerprint of the tags. |
<!-- END_TF_DOCS -->