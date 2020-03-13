#Name of the Application
name = "Agile"


# Mandatory - AWS region when resouces should be created
aws_region = "ap-south-1"

# Mandatory - AWS Availability Zone  where resouces should be created
availability_zone = "ap-south-1b"

# ID of AMI to use for the instance. Default is Ubuntu 18.04
ami = "ami-0620d12a9cf777c87"


# Type of instance
instance_type = "t2.micro"

# Key-pair Name
key_name = "mumbai-south"

# CIDR for VPC

 vpc_cidr = "10.0.0.0/16"

# CIDR for public subnets 

public_subnet_cidr = "10.0.1.0/24"

public_subnet_cidr2 = "10.0.2.0/24"

#CIDR for private subnets

private_subnet_cidr = "10.0.0.0/24"

private_subnet_cidr2 = "10.0.3.0/24"





