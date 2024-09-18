# resource "aws_route53_record" "sample_expense" {
#   zone_id = var.zone_id
#   count = length(var.instance_name) # how many records we need to create
#   name    = "${var.instance_name[count.index]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.terraform[count.index].private_ip]
#   # records = [output.instances_info[count.index].private_ip]
#   allow_overwrite = true
# }

resource "aws_route53_record" "sample_expense" {
  for_each = aws_instance.terraform
  zone_id = var.zone_id
  # count = length(var.instance_name) # how many records we need to create
  # name    = var.instance_name[count.index] == "frontend" ? var.domain_name : "${var.instance_name[count.index]}.${var.domain_name}"
  name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  # records = var.instance_name[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  # records = each.key == "frontend" ? aws_instance.terraform.public_ip : aws_instance.terraform.private_ip
  records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]

  # records = [output.instances_info[count.index].private_ip]
  allow_overwrite = true
}

# name    = "${var.instance_name[count.index]}.${var.domain_name}"
#var.environment == "prod" ? "t3.small" : "t2.micro"

