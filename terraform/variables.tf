variable "region" {
  description = "AWS region for the provider"
  type        = string
  default     = "eu-west-2"
}

# Domain name and Hosted Zone
variable "domain_name" {
  description = "Primary domain name for Route 53 and ACM certificate"
  type        = string
  default     = "infra-owen-morgan.com"
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID in Route 53 for managing DNS records"
  type        = string
  default     = "Z09823381091ASFSLUHFE"
}
