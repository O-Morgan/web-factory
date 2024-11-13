# Root variables.tf

# Networking variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]
}

# Security Group and Access
variable "http_port" {
  description = "HTTP port for ALB"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "HTTPS port for ALB"
  type        = number
  default     = 443
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed for HTTP traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "allowed_https_cidr" {
  description = "CIDR block allowed for HTTPS traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "web_server_port" {
  description = "Port for web server traffic from ALB"
  type        = number
  default     = 80
}

# Compute variables
variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0e8d228ad90af673b"
}

variable "min_instance_count" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
  default     = 2
}

variable "max_instance_count" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
  default     = 4
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
  default     = "wf_web_server_key_pair"
}

# Domain name for Route 53 and ACM certificate
variable "domain_name" {
  description = "Primary domain name for Route 53 and ACM certificate (e.g., infra-owen-morgan.com)"
  type        = string
  default     = "infra-owen-morgan.com"
}

# Hosted zone ID for Route 53
variable "hosted_zone_id" {
  description = "Hosted Zone ID in Route 53 for managing DNS records"
  type        = string
  default     = "Z09823381091ASFSLUHFE"
}

# Certificate ARN (for use if reusing an existing certificate)
variable "certificate_arn" {
  description = "Certificate ARN for SSL (if reusing an existing certificate)"
  type        = string
  default     = ""
}
