provider "aws" {
  region="ap-south-1"
  access_key = var.access
  secret_key = var.secret
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.sshkey
}

resource "aws_instance" "Tomcat-Server" {
    ami = "ami-08e0ca9924195beba"
    instance_type = "t2.micro"
    tags = {
        Name = "Tomcat-Server"
    }
    key_name = "my-sshkey"
    user_data = data.template_file.asg_init.rendered
    provisioner "file" {
      source      = "MusicStore.war"
      destination = "/tmp/MusicStore.war"
      connection {
        type     = "ssh"
        user     = "ec2-user"
        host     = self.public_ip
        private_key = file("my-key.pem")
      }
    }
}

data "template_file" "asg_init" {
  template = file("${path.module}/userdata.tpl")
}
variable "sshkey" {
  type = string
}
variable "access" {
  type = string
}
variable "secret" {
  type = string
}
