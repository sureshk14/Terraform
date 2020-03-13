#------NAT Instance ------------

  resource "aws_instance" "Agile-NAT-SSH" {
        ami = var.ami
       //ami = "${var.ami}"
       availability_zone = "${var.availability_zone}"
       instance_type = "${var.instance_type}"
       key_name = "${var.key_name}"
       root_block_device {
       volume_size           = "20"
       volume_type           = "standard"
       delete_on_termination = true
   }
       vpc_security_group_ids = ["${aws_security_group.natsg.id}"]
       subnet_id = "${aws_subnet.Pub-sn2ELK_MGT_NAT-Agile.id}"
       associate_public_ip_address = true
       source_dest_check = false
    tags = {
        Name = "Agile-NAT-SSH"
     }
  }


#---------Agile Web Server in Private Subnet-----------------



  resource "aws_instance" "agile_ubuntu_web1" {

       ami = "${var.ami}"
       availability_zone = "${var.availability_zone}"
       instance_type = "${var.instance_type}"
       key_name = "${var.key_name}"
       root_block_device {
       volume_size           = "20"
       volume_type           = "standard"
       delete_on_termination = true
    }
       vpc_security_group_ids = ["${aws_security_group.sg-agile-web-server.id}"]
       subnet_id = "${aws_subnet.Pri-sn1APP_WEB-Agile.id}"
       associate_public_ip_address = false
       source_dest_check = false
    tags = {
        Name = "Agile_ubuntu_Web"
    } 
}




#---------------Agile APP Server-------------------



  resource "aws_instance" "agile_APP_server" {
        ami = "${var.ami}"
        availability_zone = "${var.availability_zone}"
        instance_type = "${var.instance_type}"
        key_name = "${var.key_name}"
        root_block_device {
   	volume_size           = "20"
        volume_type           = "standard"
        delete_on_termination = true
     } 
       vpc_security_group_ids = ["${aws_security_group.sg-agile-APP-server.id}"]
        subnet_id = "${aws_subnet.Pri-sn1APP_WEB-Agile.id}"
        associate_public_ip_address = false
        source_dest_check = false
    tags = {
        Name = "Agile-Ubuntu-APP"
    }
}

