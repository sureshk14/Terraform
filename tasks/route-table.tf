# ------------------- Routing ----------


resource "aws_route_table" "public-route" {
   vpc_id = "${aws_vpc.mumbai-vpc.id}"
	route {
       		cidr_block = "0.0.0.0/0"
       		gateway_id = "${aws_internet_gateway.igw.id}"
   	 }
   tags = {
   	    Name = "public-route-Mumbai"
   	}
 }


resource "aws_default_route_table" "default-route-private" {
   default_route_table_id = "${aws_vpc.mumbai-vpc.default_route_table_id}"
        route {
   	        cidr_block = "0.0.0.0/0"
             instance_id = "${aws_instance.Mumbai-south.id}"     
          }
       tags = {
       	      Name = "default-route-private-Mumbai"
       }
 }




#--- Subnet Association -----


resource "aws_route_table_association" "arts1a" {
        subnet_id = "${aws_subnet.Pub-sn1Mumbai-South.id}"
        route_table_id = "${aws_route_table.public-route.id}"
}



resource "aws_route_table_association" "arts-p-1a" {
        subnet_id = "${aws_subnet.Pri-sn1Mumbai-South.id}"
        route_table_id = "${aws_vpc.mumbai-vpc.default_route_table_id}"
}


