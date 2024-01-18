/* Provider Block
   declare the specified provider and other settings */

provider "aws" {
  region  = "us-west-2"
}


/* Resource Block
   The resources to build (EC2, S3 bucket, etc.)       
resource <resource type> <resource name>  */

resource "aws_instance" "app_server" {
  # ami points to an ubuntu image (these are unique per region)
  ami = "ami-830c94e3"
  # size of the machine is t2.micro
  instance_type = "t2.micro"
  # tag is metadata information
  tags = {
    Name = "PegahAppServerInstance"
  }
}
