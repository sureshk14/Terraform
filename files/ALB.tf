/*
resource "aws_lb_target_group" "my-target-group" {
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  name        = "my-test-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "${aws_vpc.my_vpc.id}"
}


resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment1" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  target_id        = "${aws_instance.agile_ubuntu_web1.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment2" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  target_id        = "${aws_instance.agile_APP_server.id}"
  port             = 80
}

resource "aws_lb" "my-aws-alb" {
  name     = "my-test-alb"
  internal = false

  security_groups = [
    "${aws_security_group.sg-agile-ALB.id}",
  ]

output "subnet1" {
  value = "${element(aws_subnet.Pub-sn1ALB-Agile.*.id, 1 )}"
}

output "subnet2" {
  value = "${element(aws_subnet.Pub-sn2ELK_MGT_NAT-Agile.*.id, 2 )}"
}


subnets = ["${aws_subnet.Pub-sn1ALB-Agile.id}",
    "${aws_subnet.Pri-db-sn2RDS-Agile-1a.id}",
  ]


  tags = {
    Name = "sg-agile-ALB"
  }

  ip_address_type    = "ipv4"
  load_balancer_type = "application"
}


data "aws_acm_certificate" "groots_in.ca_crt " {
provider = "aws.ap-south-1"
domain = "*.groots.in"
statuses = ["ISSUED"]
}



resource "aws_iam_server_certificate" "test_cert" {
  name             = "some_test_cert"
  certificate_body = "${file("groots_in.ca.crt")}"
  private_key      = "${file("groots_in.key")}"
}

resource "aws_lb_listener" "agile-alb-listner1" {
  load_balancer_arn = "${aws_lb.my-aws-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  }
}

resource "aws_lb_listener" "agile-alb-listner2" {
  load_balancer_arn = "${aws_lb.my-aws-alb.arn}"
  port              = 443
  protocol          = "HTTPS"
  
  certificate_arn   = aws_iam_server_certificate.ssl_cert[0].arn
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "data.aws_iam_server_certificate.test_cert.arn"
// certificate_arn   = "arn:aws:acm:ap-south-1:314559611088:certificate/0258ab22-c4e0-43a7-88c7-5ced0479f4a6"


  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  }
}


*/
