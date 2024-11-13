# compute/outputs.tf

output "wf_alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.wf_alb.dns_name
}

output "wf_alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_lb.wf_alb.zone_id
}
