variable "aks_name" {
    type        = string
    description = "The name of the AKS cluster"
}

variable "location" {
    type        = string
    description = "The location of the resource group"
}

variable "resource_group_name" {
    type        = string
    description = "The name of the resource group"
}

variable "node_count" {
    type        = number
    description = "The number of nodes in the AKS cluster"
}