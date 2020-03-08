variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "ap-south-1"
  }

variable "ami" {
    description = "AMIs by region"
    default =  "ami-0009e88f05cf1087c" # centos
  }


variable "instance_type" {
    default = "t2.micro"
 } 


variable "availability_zone" {
     description = "Availability Zone by region"
     default = "ap-south-1b"
  }

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
 }




variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/24"
 }

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.1.0/24"
 }

variable "key_name" {
  description = "Name of my AWS key pair"
  default = "mumbai-south"
 }


