# compute/variables.tf

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
  description = "Primary domain name for Route 53 and ACM certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID for Route 53"
  type        = string
}

variable "certificate_arn" {
  description = "Certificate ARN for SSL (if reusing an existing certificate)"
  type        = string
}
