variable "servicebus_namespace_name" {
    type        = string
    description = "The name of the service bus namespace"
}

variable "resource_group_name" {
    type        = string
    description = "The name of the resource group"
}

variable "location" {
    type        = string
    description = "The location of the resource group"
}

variable "tags" {
    type        = map(string)
    description = "A mapping of tags to assign to the resource."
}