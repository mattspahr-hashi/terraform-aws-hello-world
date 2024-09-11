output "web-server-ip" {
  value = aws_instance.python_backend.public_ip
}
