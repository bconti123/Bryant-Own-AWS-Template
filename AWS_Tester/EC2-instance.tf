## AWS instance

## Template Instance Here
resource "aws_instance" "my_latestecs_instance" {
    ami = "ami-0947d2ba12ee1ff75"
    ##ami           = "${data.aws_ami.latest_ecs.id}" ## Copy/Paste any AMI you want
    instance_type = "t2.micro" ## Pick which instance type you want
    # key_name = ## If you have key pair, put it here.
    # subnet_id = ## Check vpc.tf
    
    # vpc_security_group_ids = 

    user_data = <<-EOF
        #! /bin/bash
        sudo yum update -y
		sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
		sudo yum install -y httpd mariadb-server
		sudo systemctl start httpd
		sudo systemctl enable httpd
		EOF

    tags = {
            Name = "Name_EC2"
    }
    
}