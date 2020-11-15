
## AWS CLOUD9
resource "aws_cloud9_environment_ec2" "example-name" {
  instance_type = "t2.micro"
  name          = "example-env"
}