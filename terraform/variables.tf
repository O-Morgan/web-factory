variable "region" {
  description = "AWS region for the provider"
  type        = string
  default     = "eu-west-2"
}

# Domain and Hosted Zone
variable "domain_name" {
  description = "Primary domain name for Route 53 and ACM certificate"
  type        = string
  default     = "infra-owen-morgan.com"
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID for Route 53"
  type        = string
  default     = "Z09823381091ASFSLUHFE"
}

variable "certificate_arn" {
  description = "Certificate ARN for SSL"
  type        = string
}
