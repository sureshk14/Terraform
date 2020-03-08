
# create public subnet


resource "aws_subnet" "Pub-sn1Mumbai-South" {
//      availability_zone = "${data.aws_availability_zones.azs.names[0]}"
        availability_zone = "${var.availability_zone}"
        cidr_block = "${var.public_subnet_cidr}"
        vpc_id = "${aws_vpc.mumbai-vpc.id}"
        map_public_ip_on_launch = "true"
     tags = {
        Name = "Pub-sn1Mumbai-South"}
  }

# 10.0.2.0/24


# Create private subnet


resource "aws_subnet" "Pri-sn1Mumbai-South" {
        //availability_zone = "${data.aws_availability_zones.azs.names[0]}"
        availability_zone = "${var.availability_zone}"

        cidr_block = "${var.private_subnet_cidr}"
        vpc_id = "${aws_vpc.mumbai-vpc.id}"
   tags = {
        Name = "Pri-sn1Mumbai-South"
      }
}

