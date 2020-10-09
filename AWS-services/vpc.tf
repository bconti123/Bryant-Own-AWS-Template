
resource "aws_vpc" "VPC_Name" {
    cidr_block          = "192.168.0.0/16"
    instance_tenancy    = "default"

    tags = {
        Name = "VPC_Name"
    } 
}

# Public Subnet 1

resource "aws_subnet" "Public_Subnet_1" {
    vpc_id = "${aws_vpc.VPC_Name.id}"
    availability_zone = "us-east-1a"
    cidr_block = "192.168.40.0/21"

    tags = {
        Name = "Public_Subnet_1"
    }
}

