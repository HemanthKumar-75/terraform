variable "ami_id"{
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "this ami is for devops practice"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
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

variable "sec_group" {
    default = "allow_ssh_terraform"
}

variable "sg_desc" {
    default = "opening port 22 for ssh for terraform"
}

variable "from_port" {
    default = 22
}

variable "protocols" {
    default = "tcp"
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}