#--- Create Internet Gateway


resource "aws_internet_gateway" "igw" {
        vpc_id = "${aws_vpc.mumbai-vpc.id}"
      tags = {
            Name = "mumbai-igw"
          }
   }

