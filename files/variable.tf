variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
  }

variable "ami" {
    description = "AMIs by region"
    default =  "ami-04b9e92b5572fa0d1" # ubuntu 14.04 LTS
  }


variable "instance_type" {
    default = "t2.micro"
 } 


variable "availability_zone" {
     description = "Availability Zone by region"
     default = "us-east-1a"
  }

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/16"
 }




variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.1.0/24"
 }

variable "public_subnet_cidr2" {
    description = "CIDR for the Public Subnet2"
    default = "10.0.2.0/24"
 }

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.0.0.0/24"
 }

variable "private_subnet_cidr2" {
    description = "CIDR for the Private Subnet2"
    default = "10.0.3.0/24"
 }

variable "key_name" {
  description = "Name of my AWS key pair"
  default = "NatInstaance"
 }


