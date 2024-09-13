resource "aws_security_group" "ssh_terraform" {
    name = var.sec_group
    description = var.sg_desc

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = var.from_port
        to_port          = var.from_port
        protocol         = var.protocols
        cidr_blocks      = var.cidr_blocks #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

   tags = var.tags
}

resource "aws_instance" "terraform" {
    count = length(var.instance_name)
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.ssh_terraform.id]
    tags = merge(var.tags, {Name = var.instance_name[count.index]})
}

#export TF_VAR_instance_type=t3.xlarge  #terraform.tfvars

#1. commandline
#2. terraform.tfvars
#3. environment variables
#4. default
#5. prompt if we not given at any places