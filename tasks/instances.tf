#------AWS Instance ------------

  resource "aws_instance" "Mumbai-south" {
 
       ami = "${var.ami}"
       availability_zone = "${var.availability_zone}"
       instance_type = "${var.instance_type}"
       key_name = "${var.key_name}"
     
    root_block_device {
    volume_size           = "20"
    volume_type           = "standard"
    delete_on_termination = true
  }
  //user_data = "${file("/home/dhuldev/suresh/tasks/ mounting-coomand-file.sh")}"
      
    user_data = <<-EOF
                #! /bin/bash
                sudo file -s /dev/xvdg
		sudo mkfs -t xfs /dev/xvdg
		sudo mkdir /data
		sudo mount /dev/xvdg /data
		echo /dev/xvdg  /data xfs defaults,nofail 0 2 >> /etc/fstab

  EOF

       vpc_security_group_ids = ["${aws_security_group.mumbai-south-sg.id}"]
       subnet_id = "${aws_subnet.Pub-sn1Mumbai-South.id}"
       associate_public_ip_address = true
       source_dest_check = false
    tags = {
        Name = "Mumbai-south"
     }
  }


