variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
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

variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = t2.micro
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0e8d228ad90af673b"
}

variable "min_instance_count" {
  description = "Minimum number of EC2 instances"
  type        = number
  default     = 2
}

variable "max_instance_count" {
  description = "Maximum number of EC2 instances"
  type        = number
  default     = 4
}
