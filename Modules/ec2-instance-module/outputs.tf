output "instance_details" {
  value = [
    for instance in aws_instance.webserver : {
      name       = instance.tags["Name"]
      id         = instance.id
      public_ip  = instance.public_ip
      private_ip = instance.private_ip
    }
  ]
}