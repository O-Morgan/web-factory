# Networking references from networking module outputs
variable "vpc_id" {
  description = "VPC ID for EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EC2 instances"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for ALB"
  type        = string
}

variable "web_security_group_id" {
  description = "Security group ID for web servers"
  type        = string
}

# Compute-specific configurations
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

variable "certificate_arn" {
  description = "Certificate ARN for SSL (if reusing an existing certificate)"
  type        = string
  default     = ""
}
# compute/variables.tf

variable "domain_name" {
  description = "Primary domain name for Route 53 and ACM certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID for Route 53"
  type        = string
}
