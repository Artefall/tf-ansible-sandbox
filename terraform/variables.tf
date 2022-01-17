variable "region" {
  type        = string
  description = "Region where terraform will place resources"
}

variable "access_key" {
  type        = string
  description = "Access key for cloud"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Secret key for cloud"
  sensitive   = true
}

