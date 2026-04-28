output "app_url" {
  description = "CloudOps Dashboard URL"
  value       = "http://${aws_instance.web.public_ip}"
}

output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.web.public_ip
}

output "ssh_command" {
  description = "SSH command"
  value       = "ssh -i ~/Desktop/cloudops-key.pem ec2-user@${aws_instance.web.public_ip}"
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "s3_bucket" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.storage.id
}

output "workspace" {
  description = "Current workspace"
  value       = terraform.workspace
}

output "account_id" {
  description = "AWS account"
  value       = data.aws_caller_identity.current.account_id
}