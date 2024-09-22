resource "aws_security_group" "expense" {
    name = "${var.sec_group}-${var.environment}"
    description = var.sg_desc

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    # dynamic "ingress" {
    ingress {
        # for_each = var.from_port
    #     for_each = flatten([for service, ports in var.from_port : [
    #   for port in ports : {
    #     service_name = service
    #     port         = port
    #   }
    # ]])
        # content {
           from_port        = var.from_port # ingress.value.port
           to_port          = var.from_port # ingress.value.port
           protocol         = var.protocols
           cidr_blocks      = var.cidr_blocks #allow from everyone
           ipv6_cidr_blocks = ["::/0"]
        # }
    }
   tags = merge( var.tags,{Nmae = "${var.sec_group}-${var.environment}"} )
}

resource "aws_instance" "expense" {
    for_each = var.instance_names
    # count = length(var.instance_names)
    ami = var.ami_id
    instance_type = each.value
    # instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.expense.id]
    tags = merge(var.tags, {Name = each.key})
    # tags = merge(var.tags, {Name = var.instance_names[count.index]})
}

#export TF_VAR_instance_type=t3.xlarge  #terraform.tfvars

#1. commandline
#2. terraform.tfvars
#3. environment variables
#4. default
#5. prompt if we not given at any places