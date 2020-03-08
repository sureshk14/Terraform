# --- Create a VPC ------


resource "aws_vpc" "mumbai-vpc" {
        cidr_block = "${var.vpc_cidr}"
       enable_dns_hostnames = true
        instance_tenancy = "default"
   tags = {
         Name = "Mumbai-vpc"
        }
  }



