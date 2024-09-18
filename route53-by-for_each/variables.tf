variable "ami_id"{
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "this ami is for devops practice"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "instance_name" {
    # type = list(string)
    # default = ["mysql","backend","frontend"]
    type = map
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontend = "t2.micro"
    }
}

variable "tags" {
    type = map
    default = {
        # Name = var.instance_name[count.index]
        Project = "Expense"
        Created_by = "Hemanth"
        Environment = "Dev"
        Created_on = "terraform"

    }
}

variable "zone_id" {
    default = "Z05267743DLV8AUL24HBJ" # id of the hosted zone
}

variable "domain_name" {
    default = "hemanthkumar.online"
}

variable "sec_group" {
    default = "allow_ssh_terraform"
}

variable "sg_desc" {
    default = "opening port 22 for ssh for terraform"
}

variable "from_port" {
    default = 22
    type = number
}

variable "protocols" {
    default = "tcp"
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}

# variable "records" {
#     default = var.instance_name[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
# }