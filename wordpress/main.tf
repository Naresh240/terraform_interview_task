resource "null_resource" "wordpress" {
  count = 2
    
  connection {
    host        = element(var.public_ips, count.index)
    type        = "ssh"
    user        = "ec2-user"
    private_key = var.key_name
  }
  
  provisioner "remote-exec" {
    inline = [
        # Write commands to intstall wordpress and connect to RDS configuration
    ]
  }
}