# Output for ACM Certificate ARN to use with ALB in compute module
output "certificate_arn" {
  description = "The ARN of the ACM certificate for use with ALB"
  value       = var.certificate_arn
}

