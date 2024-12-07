variable "storage_account_name" {
    type = string
    description = "The name of the Storage Account"
}

variable "location" {
    type = string
    description = "The location of the Storage Account"
}

variable "resource_group_name" {
    type = string
    description = "The name of the Resource Group"
}

variable "account_tier" {
    type = string
    description = "The Tier of the Storage Account"
}

variable "account_replication_type" {
    type = string
    description = "The Replication Type of the Storage Account"
}

variable "tags" {
    type = map(string)
    description = "The tags to apply to the Storage Account"
}

variable "container_name" {
    type = string
    description = "The name of the private container"
}

variable "automatic_container_name" {
    type = string
    description = "The name of the private automatic container"
}
