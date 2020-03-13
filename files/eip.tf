
# - Create Elastic IP


resource "aws_eip" "eip" {
      //  instance = "${aws_instance.Agile-NAT-SSH.id}"
        vpc = true
        depends_on = ["aws_internet_gateway.igw"]

   }
