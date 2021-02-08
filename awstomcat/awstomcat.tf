provider "aws" {
  region=var.region
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
        private_key = file("my-sshkey.pem")
      }
    }
}

data "template_file" "asg_init" {
  template = file("${path.module}/userdata.tpl")
}
