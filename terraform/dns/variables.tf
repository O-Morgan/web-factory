# DNS Variables
variable "domain_name" {
  description = "The domain name for Route 53 and ACM certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID in Route 53"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "The Zone ID of the ALB"
  type        = string
}
