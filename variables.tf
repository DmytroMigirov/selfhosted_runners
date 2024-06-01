variable "region" {
  default = "us-east-1"
}

variable "name" {
  default = "CircleCI"
}

variable "key_name" {
  type        = string
  description = "Key name"
  default     = "prod-key"     
}
