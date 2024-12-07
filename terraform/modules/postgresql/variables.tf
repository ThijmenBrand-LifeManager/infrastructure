variable postgres_server_name {
  type        = string
  description = "The name for the postgresql database server"
}

variable resource_group_name {
  type        = string
  description = "The name of the resource group in which to create the postgresql database server"
}

variable location {
  type        = string
  description = "The location/region where the postgresql database server will be created"
}

variable tags {
  type        = map(string)
  description = "A mapping of tags to assign to the postgresql database server"
}

variable postgres_version {
  type        = string
  description = "The version of the postgresql database server"
  default     = "16"
}

variable administrator_username {
  type        = string
  description = "The administrator username for the postgresql database server"
}

variable administrator_password {
  type        = string
  description = "The administrator password for the postgresql database server"
}