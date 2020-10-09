## AWS instance

resource "aws_instance" "my_latestecs_instance" {
    ## ami = "ami-0947d2ba12ee1ff75"
    ami           = "${data.aws_ami.latest_ecs.id}"
    instance_type = "t2.micro"
}