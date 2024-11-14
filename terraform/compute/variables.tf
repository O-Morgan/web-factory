# VPC ID for resources in the compute module
variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

# Public and private subnet IDs for ALB and EC2 instances
variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EC2 instances"
  type        = list(string)
}

# Security group IDs
variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "web_security_group_id" {
  description = "Security group ID for web servers"
  type        = string
}

# EC2 instance configuration
variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "min_instance_count" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
}

variable "max_instance_count" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
}

# Route 53 and SSL/TLS variables
variable "domain_name" {
  description = "Domain name for Route 53 and ACM certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted zone ID for Route 53"
  type        = string
}

variable "certificate_arn" {
  description = "Certificate ARN for SSL (if reusing an existing certificate)"
  type        = string
  default     = "" # Leave empty or set directly if you'd like
}
