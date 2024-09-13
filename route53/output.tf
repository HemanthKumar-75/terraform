# output "public_ip_addr" {
#   value = aws_instance.terraform[*].public_ip
#   sensitive = false
#   description = "This is public ip of instance"
# }

# output "private_ip_addr" {
#   value = aws_instance.terraform[*].private_ip
#   sensitive = false
#   description = "This is private ip of instance"
# }

output "instances_info" {
  value = aws_instance.terraform
}

# output "public_ip_addr" {
#   value = aws_instance.terraform[count.index].public_ip
#   sensitive = false
#   description = "This is public ip of instance"
# }

# output "private_ip_addr" {
#   value = aws_instance.terraform[count.index].private_ip
#   sensitive = false
#   description = "This is private ip of instance"
# }