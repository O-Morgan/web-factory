output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = module.dns.certificate_arn
}
