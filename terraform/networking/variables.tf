# Networking Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "http_port" {
  description = "HTTP port for ALB"
  type        = number
}

variable "https_port" {
  description = "HTTPS port for ALB"
  type        = number
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed for HTTP traffic"
  type        = string
}

variable "allowed_https_cidr" {
  description = "CIDR block allowed for HTTPS traffic"
  type        = string
}

variable "web_server_port" {
  description = "Port for web server traffic from ALB"
  type        = number
}
