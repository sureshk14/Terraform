
# - Create Elastic IP


resource "aws_eip" "eip" {
        instance = "${aws_instance.Mumbai-south.id}"
        vpc = true
        depends_on = ["aws_internet_gateway.igw"]

   }
