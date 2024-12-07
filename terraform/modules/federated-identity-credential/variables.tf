variable "federated_identity_credential_name" {
    type = string
    description = "The name of the federated identity credential"
}

variable "rg_name" {
    type = string
    description = "The name of the resource group"
}

variable "audience_name" {
    type = string
    description = "The audience name"
}

variable "issuer_url" {
    type = string
    description = "The issuer URL"
}

variable "user_assigned_identity_id" {
    type = string
    description = "The user assigned identity ID"
}

variable "subject" {
    type = string
    description = "The subject"
}