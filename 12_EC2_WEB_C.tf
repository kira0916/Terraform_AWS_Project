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
yum install -y httpd mysql

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
   
mysql -uroot -pIt1234567! -hdb.cvf5xzkp0bre.ap-northeast-2.rds.amazonaws.com << AOF

use db;

create table user(
     id char(20) not null PRIMARY KEY,
     passwd char(20) not null,
     name char(20) not null,
     email varchar(30) not null,
     isadmin char(2) not null);

insert into user (id,passwd,name,email,isadmin) values  ('admin', 1,' ad','ad', 0);

 create table company(
    company_num int(5) PRIMARY KEY,   
    company_subject char(100) not null,
    company_name char(50) not null,
    company_scale char(20) not null,
    company_career char(20),
    company_education char(20),
    company_location char(50),
    company_fulltime char(20),
    company_field char(20),
    company_image varchar(500),
    company_url varchar(500),
    company_period char(30),
    company_q1 varchar(500),
    company_q2 varchar(500),
    company_q3 varchar(500)
);

create table resume(
     id char(20) not null ,
     company_name char(50) ,
     company_a1 varchar(2000),
     company_a2 varchar(2000),
     company_a3 varchar(2000)
);

AOF

EOF
  depends_on = [
    aws_db_instance.company_mydb
  ]
    tags = {
      "Name" = "WEBC"
    }
}


