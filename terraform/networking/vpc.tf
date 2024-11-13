resource "aws_vpc" "wf_main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "WF_Main_VPC"
  }

  # tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
}

resource "aws_subnet" "wf_public_subnet_1" {
  vpc_id                  = aws_vpc.wf_main_vpc.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "WF_Public_Subnet_1"
  }
}

resource "aws_subnet" "wf_public_subnet_2" {
  vpc_id                  = aws_vpc.wf_main_vpc.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "WF_Public_Subnet_2"
  }
}

resource "aws_subnet" "wf_private_subnet_1" {
  vpc_id            = aws_vpc.wf_main_vpc.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "WF_Private_Subnet_1"
  }
}

resource "aws_subnet" "wf_private_subnet_2" {
  vpc_id            = aws_vpc.wf_main_vpc.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "WF_Private_Subnet_2"
  }
}

resource "aws_internet_gateway" "wf_igw" {
  vpc_id = aws_vpc.wf_main_vpc.id
  tags = {
    Name = "WF_Internet_Gateway"
  }
}

# Public Route Table
resource "aws_route_table" "wf_public_route_table" {
  vpc_id = aws_vpc.wf_main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wf_igw.id
  }

  tags = {
    Name = "WF_Public_Route_Table"
  }
}

# Route Table Association for Public Subnet 1
resource "aws_route_table_association" "wf_public_subnet_assoc_1" {
  subnet_id      = aws_subnet.wf_public_subnet_1.id
  route_table_id = aws_route_table.wf_public_route_table.id
}

# Route Table Association for Public Subnet 2
resource "aws_route_table_association" "wf_public_subnet_assoc_2" {
  subnet_id      = aws_subnet.wf_public_subnet_2.id
  route_table_id = aws_route_table.wf_public_route_table.id
}
