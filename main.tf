provider "aws" {
  region = "ap-south-1"
}

# 2a
# A VPC for the application servers
resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "olya-vpc"
  }
}

# 2b
# A Subnet for the application servers
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "olya-public-subnet"
  }
}

# 2d
# An internet gateway to allow assignment servers to access the internet.
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "olya-internet-gateway"
  }
}

# 2d
resource "aws_route_table" "table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "olya-route-table"
  }
}

# 2d
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.table.id
}

# 2c
# Security Groups, to later apply to the application servers, that will enforce the following network segmentation: 
resource "aws_security_group" "group" {
    vpc_id = aws_vpc.vpc.id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    # FIXME allow from workstation only
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # FIXME allow from LB only
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # 2c4
    ingress {
      description = "value"
      from_port = 0
      to_port = 0
      protocol = "TCP"
      self = true
    }

    tags = {
        Name = "olya-security-group"
    }
}