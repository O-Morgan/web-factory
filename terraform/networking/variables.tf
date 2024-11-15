variable "vpc_cidr" {
  description = "CIDR block for the VPC"
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
  default     = 8080
}

variable "domain_name" {
  description = "Domain name for Route 53"
  type        = string
  default     = "infra-owen-morgan.com"
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID for Route 53"
  type        = string
  default     = "Z09823381091ASFSLUHFE"
}
