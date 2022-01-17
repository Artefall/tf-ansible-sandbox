output "hosts"{
    description = "IP adresses of sandbox hosts"
    value = aws_eip.this[*].public_ip
}