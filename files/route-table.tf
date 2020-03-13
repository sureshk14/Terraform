# ------------------- Routing ----------


resource "aws_route_table" "public-route" {
   vpc_id = "${aws_vpc.my_vpc.id}"
	route {
       		cidr_block = "0.0.0.0/0"
       		gateway_id = "${aws_internet_gateway.igw.id}"
   	 }
   tags = {
   	    Name = "public-route"
   	}
 }


resource "aws_default_route_table" "default-route-private" {
   default_route_table_id = "${aws_vpc.my_vpc.default_route_table_id}"
        route {
   	        cidr_block = "0.0.0.0/0"
               nat_gateway_id = "${aws_nat_gateway.ngw.id}"
          }
       tags = {
       	      Name = "default-route-private"
       }
 }




#--- Subnet Association -----


resource "aws_route_table_association" "arts1a" {
        subnet_id = "${aws_subnet.Pub-sn1ALB-Agile.id}"
        route_table_id = "${aws_route_table.public-route.id}"
}


resource "aws_route_table_association" "arts1b" {
        subnet_id = "${aws_subnet.Pub-sn2ELK_MGT_NAT-Agile.id}"
        route_table_id = "${aws_route_table.public-route.id}"
}


resource "aws_route_table_association" "arts-p-1a" {
        subnet_id = "${aws_subnet.Pri-sn1APP_WEB-Agile.id}"
        route_table_id = "${aws_vpc.my_vpc.default_route_table_id}"
}

/*
resource "aws_route_table_association" "arts-p-1b" {
        subnet_id = "${aws_subnet.Pri-db-sn2RDS-Agile-1a.id}"
        route_table_id = "${aws_vpc.my_vpc.default_route_table_id}"
}
*/
