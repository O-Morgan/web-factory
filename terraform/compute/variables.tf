# compute/variables.tf

variable "vpc_id" {
  description = "VPC ID where resources will be created"
  type        = string
}

variable "wf_public_subnets" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "wf_private_subnets" {
  description = "List of private subnet IDs for EC2 instances"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "web_security_group_id" {
  description = "Security group ID for web servers"
  type        = string
}

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

variable "domain_name" {
  description = "Domain name for Route 53"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted zone ID for Route 53"
  type        = string
}

variable "certificate_arn" {
  description = "Certificate ARN for SSL"
  type        = string
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}
