variable "resource_group_name" {
  type    = string
  default = "cloudmore-devops-rg"
}

variable "location" {
  type    = string
  default = "West Europe"    # free‐tier eligible
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"   # free‐tier eligible
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
  # must meet Azure complexity: ≥12 chars, uppercase, lowercase, number, special
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID (sensitive)"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure AD Tenant ID (sensitive)"
  sensitive   = true
}