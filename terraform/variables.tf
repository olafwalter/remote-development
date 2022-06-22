
variable "region" {
  default = "eu-central-1"
}

variable "tags" {
  type        = map(string)
  description = "Tags that will be merged with internal tags for all resources"
  default     = {}
}

variable "environment" {
  type        = string
  description = "Environment name"
  default = "SGQDV-Remote-Development"
}

variable "vpc_availability_zones" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.3.0.0/16"
}

variable "vpc_public_subnets" {
  type    = list(string)
  default = ["10.3.1.0/24", "10.3.2.0/24"]
}

variable "vpc_private_subnets" {
  type    = list(string)
  default = ["10.3.10.0/24", "10.3.20.0/24"]
}

#variable "vpc_flowlog_destination" {
#   type = string
#}

variable enable_bucket_key {
  default = "true"
}

variable application_name {
  type = string
  default =   "olafwalter"
}

variable git_repo {
  type = string
  default = "https://github.com/olafwalter/remote-development.git"
}

variable component {
  type = string
  default = "remote-development"
}