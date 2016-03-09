
provider "aws" {
    access_key = "<AWS Access Key>"
    secret_key = "<AWS Secret Key>"
    region = "us-east-1"
}

resource "template_file" "salt_bootstrap_streaming" {
	filename = "salt_bootstrap.sh"
}

resource "aws_instance" "streaming" {

    # You can use either of the following:
    #    ami = "ami-b2e3c6d8"
    #    instance_type = "t1.micro"

    ami = "ami-fce3c696"
    instance_type = "m4.xlarge"
    subnet_id = "<Subnet id, of the form subnet-yyyyyyyy>"
    vpc_security_group_ids = ["Security group id, of the form sg-xxxxxxxx"]
    associate_public_ip_address = true
    private_ip = "<private IP>"
    availability_zone = "us-east-1d"
    instance_initiated_shutdown_behavior = "stop"
    user_data = "${template_file.salt_bootstrap_streaming.rendered}"
    key_name = "server_rsa"
    tags {
        Name = "streaming"
    } 
    root_block_device {  
        volume_size = 20
        volume_type = "gp2"
        delete_on_termination = true
    }
    ebs_block_device {
        device_name = "/dev/xvdb"     
        volume_size = 200
        volume_type = "standard"
        delete_on_termination = true
  }


}
