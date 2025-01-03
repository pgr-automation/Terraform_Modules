resource "aws_instance" "example" {
  count                  = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(var.subnet_id, count.index % length(var.subnet_id))
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  monitoring             = var.monitoring
  #availability_zone      = var.availability_zone ? 1 : 0
  tenancy                = var.tenancy
  user_data              = var.user_data != "" ? var.user_data : null
  #tags                   = var.tags
  iam_instance_profile   = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  tags = {
    Name = "${var.instance_name}-${count.index + 1}"
  }
  
  
  root_block_device {
    volume_size           = var.root_volume_size != null ? var.root_volume_size : null
    volume_type           = var.root_volume_type != "" ? var.root_volume_type : null
    delete_on_termination = var.root_volume_delete_on_termination != null ? var.root_volume_delete_on_termination : true
  }

  ebs_block_device {
    device_name           = var.ebs_device_name != "" ? var.ebs_device_name : null
    volume_size           = var.ebs_volume_size != null ? var.ebs_volume_size : null
    volume_type           = var.ebs_volume_type != "" ? var.ebs_volume_type : null
    delete_on_termination = var.ebs_delete_on_termination != null ? var.ebs_delete_on_termination : true
  }

  credit_specification {
    cpu_credits = var.cpu_credits != "" ? var.cpu_credits : null
  }

  network_interface {
    device_index           = 0
    network_interface_id   = var.network_interface_id != "" ? var.network_interface_id : null
  }



#  lifecycle {
#    prevent_destroy = var.prevent_destroy != null ? var.prevent_destroy : false
#  }

  metadata_options {
    http_tokens  = var.metadata_http_tokens != "" ? var.metadata_http_tokens : "required"
    http_endpoint = var.metadata_http_endpoint != "" ? var.metadata_http_endpoint : "enabled"
  }
 
}

output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}

output "private_ip" {
  value = aws_instance.example.private_ip
}
