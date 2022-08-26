resource "aws_instance" "company_ec2_WEBA" {
  ami                         = "ami-01711d925a1e4cc3a"
  instance_type               = "t2.small"
  key_name                    = "heeyun"
  vpc_security_group_ids      = [aws_security_group.company_sec.id]
  availability_zone           = "ap-northeast-2a"
  subnet_id                   = aws_subnet.company_weba.id
  associate_public_ip_address = true
  user_data                   = <<-EOF
#! /bin/bash
sudo su -
cd 
yum install -y httpd

cat > /var/www/html/health.html << EOF1
<html><body><h1>
HealthCheck-AWS-Server-1
</h1></body></html>
EOF1

sed -i '357 i ###New Configuration' /etc/httpd/conf/httpd.conf
sed -i '358 i <VirtualHost *:80>' /etc/httpd/conf/httpd.conf
sed -i '359 i ProxyPass /health.html !' /etc/httpd/conf/httpd.conf
sed -i '360 i     ProxyRequests Off' /etc/httpd/conf/httpd.conf
sed -i '361 i     ProxyPreserveHost On' /etc/httpd/conf/httpd.conf
sed -i '362 i     <Proxy *>' /etc/httpd/conf/httpd.conf
sed -i '363 i         Order deny,allow' /etc/httpd/conf/httpd.conf
sed -i '364 i         Allow from all' /etc/httpd/conf/httpd.conf
sed -i '365 i     </Proxy>' /etc/httpd/conf/httpd.conf
sed -i '366 i    ProxyPass / http://${aws_alb.company_n.dns_name}:8080/ disablereuse=on' /etc/httpd/conf/httpd.conf
sed -i '367 i    ProxyPassReverse / http://${aws_alb.company_n.dns_name}:8080/' /etc/httpd/conf/httpd.conf
sed -i '368 i </VirtualHost>' /etc/httpd/conf/httpd.conf


systemctl enable httpd
systemctl start httpd
  
EOF
    tags = {
      "Name" = "WEBA"
    }
}


