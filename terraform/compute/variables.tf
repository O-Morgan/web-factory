# compute var

variable "vpc_id" {
  description = "VPC ID for the compute module"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for resources"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for resources"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "web_security_group_id" {
  description = "Security group ID for Web Server"
  type        = string
}

variable "certificate_arn" {
  description = "ACM Certificate ARN for ALB Listener"
  type        = string
}
