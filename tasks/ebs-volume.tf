#creating and attaching ebs volume

resource "aws_ebs_volume" "data-vol" {
 availability_zone = "${aws_instance.Mumbai-south.availability_zone}"
 size = 40

 tags = {
        Name = "data-volume"
 }

}


#
resource "aws_volume_attachment" "new-vol" {
 device_name = "/dev/sdg"
 volume_id = "${aws_ebs_volume.data-vol.id}"
 instance_id = "${aws_instance.Mumbai-south.id}"


}
