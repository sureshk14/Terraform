#--------- Security Group For NAT Instance--------------


 resource "aws_security_group" "mumbai-south-sg" {
       name = "mumbai-south-sg"
       description = "Allow traffic to pass from the private subnet to the internet"

       ingress {
           from_port = 80
           to_port = 80
           protocol = "tcp"
           cidr_blocks = ["${var.private_subnet_cidr}"]
   }
       ingress {
           from_port = 443
           to_port = 443
           protocol = "tcp"
           cidr_blocks = ["${var.private_subnet_cidr}"]

      }
       ingress {
          from_port = 22
          to_port = 22
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
    }

	ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }


     egress {
         from_port = 80
         to_port = 80
         protocol = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
     }
     egress {
         from_port = 443
         to_port = 443
         protocol = "tcp"
         cidr_blocks = ["${var.private_subnet_cidr}"]

      }
	egress {
          from_port = 22
          to_port = 22
          protocol = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
   }

  egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

  vpc_id = "${aws_vpc.mumbai-vpc.id}"
    tags = {
         Name = "sg-mumbai-south"
  }

}
