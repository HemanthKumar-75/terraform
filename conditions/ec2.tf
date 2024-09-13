resource "aws_security_group" "ssh_terraform" {
    name = "allow_ssh_terraform"
    description = "opening port 22 for ssh for terraform"

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "terraform_ssh"
    }
}

resource "aws_instance" "terraform" {

    ami = "ami-09c813fb71547fc4f"
    #condition will we can be apply here 
    instance_type = var.environment == "prod" ? "t3.small" : "t2.micro"
    vpc_security_group_ids = [aws_security_group.ssh_terraform.id]
    tags = {
        Name = "terraform"
    }
}

#expression ? "run this if true" : "else run this"
#var.environment == "prod" ? "t3.small" : "t2.micro"