# --- Create a VPC ------


resource "aws_vpc" "my_vpc" {
        cidr_block = "${var.vpc_cidr}"
       enable_dns_hostnames = true
        instance_tenancy = "default"
   tags = {
         Name = "vpc_agile"
        }
  }



