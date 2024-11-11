# web-factory
a website deployed on AWS using terraform, ansible, Linux and Apache 

OIDC 


.
├── .github
│   └── workflows
│       ├── terraform-deploy.yml           # GitHub Action for Terraform deployment using OIDC
│       ├── ansible-configure.yml          # GitHub Action for Ansible configuration
│       └── drift-detection.yml            # GitHub Action for drift detection using OIDC
├── terraform
│   ├── main.tf                            # Main Terraform configuration file to call modules
│   ├── providers.tf                       # AWS provider configuration
│   ├── variables.tf                       # Global variables used across resources
│   ├── outputs.tf                         # Outputs for reference and linking resources
│   ├── networking                         # Networking resources (VPC, subnets, Route 53)
│   │   ├── vpc.tf                         # VPC, subnets, route tables
│   │   ├── route53.tf                     # Route 53 configuration for DNS
│   │   ├── security_groups.tf             # Security groups for ALB and EC2 instances
│   ├── compute                            # Compute resources (EC2, ASG, ALB, ACM)
│   │   ├── ec2_webservers.tf              # Web server EC2 instances and ASG
│   │   ├── loadbalancer.tf                # Load balancer configuration with ACM
│   │   ├── certificate.tf                 # ACM configuration for SSL certificate
│   ├── monitoring                         # Monitoring resources (Grafana and Prometheus)
│       ├── grafana_prometheus.tf          # Grafana and Prometheus EC2 configuration
├── README.md                              # Documentation on project setup and configuration



How to fmt terrform code:

Navigate to your Terraform directory:

```bash
cd path/to/your/terraform/directory
```

Run the formatting command:
```bash
terraform fmt
```

You can also add -recursive to format all files in subdirectories:
```bash
terraform fmt -recursive
```

action plan file structure