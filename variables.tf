variable "region" {
  type        = string
  description = "Provide region (location) of the VM"
}

variable "vm_name" {
  type        = string
  description = "Provide name of the VM. The VM name will be added to tags by default"
}

variable "resource_group_name" {
  type = string
  description = "Provide the Resource Group name"
}


variable "subnet_id" {
  type = string
  description = "Provide public subnet id, format: /subscriptions/<subscription_guid>/resourceGroups/<resource_group>/providers/Microsoft.Network/virtualNetworks/<vNet_name>/subnets/<subnet_name>"
}

variable "public_key_file" {
  type = string
  description = "Provide path to SSH public key for the VM"
}

variable "admin_username" {
  type = string
  default = "csradmin"
  description = "Provide local user of the VM"
}

variable "tags" {
  description = "Provide additional tags"
  default     = {}
  type        = map(string)
}

variable "custom_data" {
  description = "Custom data to bootstrap your CSR, start with: Section: IOS configuration"
  default = "Section: IOS configuration"
}


locals {
  description = "By default, VM name will be added. Additional tags will be merge with the VM name tag"
  tags = merge(
    {
      Name = var.vm_name
    },
    var.tags
  )
}
