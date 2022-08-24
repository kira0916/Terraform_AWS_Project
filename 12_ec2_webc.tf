resource "aws_instance" "company_ec2_WEBC" {
  ami                         = "ami-01711d925a1e4cc3a"
  instance_type               = "t2.small"
  key_name                    = "heeyun"
  vpc_security_group_ids      = [aws_security_group.company_sec.id]
  availability_zone           = "ap-northeast-2c"
  subnet_id                   = aws_subnet.company_webc.id
  associate_public_ip_address = true
  user_data                   = <<-EOF
#! /bin/bash
sudo su -
cd 
yum install -y httpd httpd-devel gcc gcc-c++ wget make
wget https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz --no-check-certificate
tar xvfz tomcat-connectors-1.2.48-src.tar.gz
cd tomcat-connectors-1.2.48-src/native/
./configure --with-apxs=/bin/apxs
make

cat > /var/www/html/health.html << EOF1
<html><body><h1>
HealthCheck-AWS-Server-1
</h1></body></html>
EOF1

cd apache-2.0/
cp mod_jk.so /usr/lib64/httpd/modules/mod_jk.so
chmod 755 /usr/lib64/httpd/modules/mod_jk.so 


sed -i '357 i ###New Configuration' /etc/httpd/conf/httpd.conf
sed -i '358 i <VirtualHost *:80>' /etc/httpd/conf/httpd.conf
sed -i '359 i     ProxyRequests Off' /etc/httpd/conf/httpd.conf
sed -i '360 i     ProxyPreserveHost On' /etc/httpd/conf/httpd.conf
sed -i '361 i     <Proxy *>' /etc/httpd/conf/httpd.conf
sed -i '362 i         Order deny,allow' /etc/httpd/conf/httpd.conf
sed -i '363 i         Allow from all' /etc/httpd/conf/httpd.conf
sed -i '364 i     </Proxy>' /etc/httpd/conf/httpd.conf
sed -i '365 i    ProxyPass / http://${aws_alb.company_n.dns_name}:8080/ disablereuse=on' /etc/httpd/conf/httpd.conf
sed -i '366 i    ProxyPassReverse / http://${aws_alb.company_n.dns_name}:8080/' /etc/httpd/conf/httpd.conf
sed -i '367 i </VirtualHost>' /etc/httpd/conf/httpd.conf


systemctl enable httpd
systemctl start httpd
   
EOF
    tags = {
      "Name" = "WEBC"
    }
}


