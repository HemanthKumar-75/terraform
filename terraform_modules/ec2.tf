module "ec2" {
    source = "../ec2-instance"
    # instance_type = "t3.large" # while calling this we need to place this is variable
}