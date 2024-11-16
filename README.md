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



tep-by-Step Setup
Step 1: Set Up Project Structure
To start, we organized our Terraform files into modules for networking and compute to make configurations manageable and reusable.

Directory Structure:

bash
Copy code
.github/workflows/
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── networking/
│   ├── vpc.tf
│   ├── security_groups.tf
│   ├── route53.tf
│   └── outputs.tf
├── compute/
│   ├── ec2_webserver.tf
│   ├── loadbalancer.tf
│   ├── autoscaling.tf
│   ├── certificate.tf
│   └── outputs.tf


Step 2: Initialize Variables
We defined variables to make the configurations flexible. This involved creating variables.tf in both the networking and compute modules as well as the root level.

Variables in Root: Holds global values like vpc_cidr, availability_zones, and AWS region configurations.
Module-Specific Variables: In each module, define variables specific to the resources they manage, like subnet CIDRs in networking and instance types in compute.
Step 3: Configure Networking Module
In the networking module, we set up foundational resources such as VPCs, subnets, and security groups.

VPC and Subnets: Defined in vpc.tf with separate CIDR blocks for public and private subnets.

Security Groups: Configured in security_groups.tf to control traffic for ALB and web servers.

Route 53 Setup: Configured route53.tf to manage DNS for the domain and subdomain.

Workaround: Issues with missing or undeclared subnet and VPC variables were fixed by confirming all outputs in outputs.tf and ensuring they matched the module’s input variables.

Step 4: Configure Compute Module
In the compute module, we set up EC2 instances, an ALB, and an Auto Scaling group.

EC2 Instances: Defined in ec2_webserver.tf with an Auto Scaling group to handle load.

ALB and SSL Certificate: Configured in loadbalancer.tf with an SSL certificate to enable HTTPS.

Outputs: Provided outputs for ALB DNS name and zone ID to use in the networking module.

Workaround: Missing dependencies between resources were resolved by using depends_on where needed and ensuring all required attributes were properly referenced.

Step 5: Integrate Networking and Compute Modules
In main.tf, we linked outputs from the networking module as inputs to the compute module.

Example:

hcl
Copy code
module "networking" {
  source = "./networking"
  # Variable mappings for networking resources
}

module "compute" {
  source            = "./compute"
  vpc_id            = module.networking.wf_vpc_id
  public_subnet_ids = module.networking.wf_public_subnet_ids
  # More mappings for compute resources
}
Workaround: We resolved issues with cyclic dependencies between modules by adjusting output references and removing unnecessary outputs that created circular logic.

Step 6: Route 53 and SSL Certificates
SSL Certificate: Configured in the compute module for the ALB in certificate.tf.

DNS Records: We split Route 53 records between networking and compute modules.

Workaround: Issues with missing or undeclared attributes in Route 53 records were resolved by centralizing DNS records in one module to avoid redundancy.

Common Issues and Solutions
Missing Required Arguments:

Solution: Ensured all required variables were declared in variables.tf and properly referenced in main.tf.
Cyclic Dependencies:

Solution: Simplified output references and removed unnecessary cross-references between networking and compute modules.
State Locking Issues:

Solution: Cleared state lock in DynamoDB when encountering concurrency issues. We ensured only one Terraform process accesses the state at a time.
Undeclared Input Variables:

Solution: Double-checked variable declarations in each module and avoided referencing undeclared variables in main.tf.






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

action plan file structure - if action syntax error the tell tail sign is the action will sit witht the full file path extension

https://docs.github.com/en/code-security/dependabot/working-with-dependabot/keeping-your-actions-up-to-date-with-dependabot 

https://aws.amazon.com/ec2/instance-types/

git tag -d <tag-name>

store state remotely 
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-remote 

updated terraform backend and OIDC access

update

fmt all tf files
terraform fmt -recursive


test