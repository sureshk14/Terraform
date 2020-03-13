
# create public subnet


resource "aws_subnet" "Pub-sn1ALB-Agile" {
//      availability_zone = "${data.aws_availability_zones.azs.names[0]}"
        availability_zone = "${var.availability_zone}"
        cidr_block = "${var.public_subnet_cidr}"
        vpc_id = "${aws_vpc.my_vpc.id}"
        map_public_ip_on_launch = "true"
     tags = {
        Name = "Pub-sn1ALB-Agile-10.0.1.0/24-us-east-2a"
}
  }

# 10.0.2.0/24

resource "aws_subnet" "Pub-sn2ELK_MGT_NAT-Agile" {
        //availability_zone = "${data.aws_availability_zones.azs.names[1]}"
       availability_zone = "${var.availability_zone}"
        cidr_block = "${var.public_subnet_cidr2}"
        vpc_id = "${aws_vpc.my_vpc.id}"
        map_public_ip_on_launch = "true"
    tags = {
        Name = "Pub-sn2ELK_MGT_NAT-Agile-10.0.2.0/24-us-east-2a"
     }
}



# Create private subnet


resource "aws_subnet" "Pri-sn1APP_WEB-Agile" {
        //availability_zone = "${data.aws_availability_zones.azs.names[0]}"
    //    availability_zone = "us-east-1a"
        availability_zone = "${var.availability_zone}"

        cidr_block = "${var.private_subnet_cidr}"
        vpc_id = "${aws_vpc.my_vpc.id}"
   tags = {
        Name = "Pri-sn1APP_WEB-Agile-10.0.0.0/24-us-east-2a"
      }
}

/*
resource "aws_subnet" "Pri-db-sn2RDS-Agile-1a" {
       // availability_zone = "${data.aws_availability_zones.azs.names[1]}"
        availability_zone = "us-east-1a"
	cidr_block = "${var.private_subnet_cidr2}"
        vpc_id = "${aws_vpc.my_vpc.id}"
    tags = {
         Name = "Pri-db-sn2RDS-Agile-10.0.3.0/24-us-east-1a"
       }
}


 resource "aws_subnet" "Pri-db-sn2RDS-Agile-1c" {
       // availability_zone = "${data.aws_availability_zones.azs.names[1]}"
        availability_zone = "us-east-1b"
        cidr_block = "${var.private_subnet_cidr2}"
        vpc_id = "${aws_vpc.my_vpc.id}"
    tags = {
         Name = "Pri-db-sn2RDS-Agile-10.0.3.0/24-us-east-1c"
       }
}*/
