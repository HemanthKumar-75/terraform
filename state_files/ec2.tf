resource "aws_security_group" "ssh_terraform" {
    name = var.sec_group
    description = var.sg_desc

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks #allow from everyone
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
    #here we are using the count function using index to 
    count = length(var.instance_name)
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.ssh_terraform.id]
    tags = merge(var.tags, {Name = var.instance_name[count.index]})
}