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

variable "instance_names" {
    # type = list(string)
    # default = ["mysql", "backend", "frontend"]
    type = map
    default = {
        mysql = "t3.large"
        backend = "t3.small"
        frontend = "t3.micro"
    }
}

variable "sec_group" {
    default = "for_each"
}

variable "sg_desc" {
    default = "opening port 22 for ssh for terraform"
}

variable "from_port" {
    default = 22
    # type = list(number)
    # default = [22,80,3306,80]
    # type = map(list(number))
    # default = {
    #     mysql = [22,3306,80]
        # backend = [22,80,3306]
        # frontend = [22,80,8080]
    # }
}

variable "protocols" {
    default = "tcp"
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}