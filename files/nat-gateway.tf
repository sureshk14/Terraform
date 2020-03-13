# -------------- NAT Gateway

resource "aws_nat_gateway" "ngw" {
        allocation_id = "${aws_eip.eip.id}"
        subnet_id = "${aws_subnet.Pub-sn2ELK_MGT_NAT-Agile.id}"
        depends_on = ["aws_internet_gateway.igw"]
    tags = {
        Name = "Nat Gateway"
      }
 }

