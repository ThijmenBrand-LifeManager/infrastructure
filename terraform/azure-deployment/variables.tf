variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default     = "lfm-rg"
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
  default     = "northeurope"
}

variable "tags" {
  description = "A mapping of tags to assign to the resources."
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "ThijmenBrand"
    application = "lifemanager"
  }
}

variable "env" {
  description = "The environment in which the resources will be created."
  type        = string
}

variable "postgres_server_name" {
  description = "The name of the PostgreSQL server."
  type        = string
  default     = "lfm-dev-pgsql-db"
}

variable "postgres_version" {
  description = "The version of PostgreSQL to deploy."
  type        = string
  default     = "16"
}

variable "administrator_username" {
  description = "The administrator username for the PostgreSQL server."
  type        = string
}

variable "administrator_password" {
  description = "The administrator password for the PostgreSQL server."
  type        = string
}

variable "servicebus_namespace_name" {
  description = "The name of the Service Bus namespace."
  type        = string
  default     = "lfm-dev-servicebus"
}

variable "aks_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "lfm-dev-k8s"
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 1
}