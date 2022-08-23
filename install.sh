#! /bin/bash
sudo su -
cd 
yum install -y httpd httpd-devel gcc gcc-c++ wget make
wget https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz --no-check-certificate
tar xvfz tomcat-connectors-1.2.48-src.tar.gz
cd tomcat-connectors-1.2.48-src/native/
./configure --with-apxs=/bin/apxs
make

cat > /var/www/html/health.html << EOF
<html><body><h1>
HealthCheck-AWS-Server-1
</h1></body></html>
EOF

cd apache-2.0/
cp mod_jk.so /usr/lib64/httpd/modules/mod_jk.so
chmod 755 /usr/lib64/httpd/modules/mod_jk.so 


sed -i '57 i LoadModule jk_module /usr/lib64/httpd/modules/mod_jk.so' /etc/httpd/conf/httpd.conf
sed -i '58 i <IfModule jk_module>' /etc/httpd/conf/httpd.conf
sed -i '59 i JkWorkersFile /etc/httpd/conf/workers.properties' /etc/httpd/conf/httpd.conf
sed -i '60 i JkLogFile /var/log/httpd/mod_jk.log' /etc/httpd/conf/httpd.conf
sed -i '61 i JkLogLevel info' /etc/httpd/conf/httpd.conf
sed -i '62 i JkLogStampFormat "[%a %b $d %H:%M:%S %Y]"' /etc/httpd/conf/httpd.conf
sed -i '63 i JkMount /*.* worker1' /etc/httpd/conf/httpd.conf
sed -i '64 i SetEnvIf Request_URI "health\.+html$" html_filter_flag=1' /etc/httpd/conf/httpd.conf
sed -i '65 i SetEnvIf html_filter_flag 1 no-jk' /etc/httpd/conf/httpd.conf
sed -i '66 i </IfModule>' /etc/httpd/conf/httpd.conf
cat >> /etc/httpd/conf/workers.properties << EOF

worker.list=worker1
worker.worker1.type=ajp13
worker.worker1.host=10.0.2.183
worker.worker1.port=8009
worker.worker1.lbfactor=1
EOF

systemctl enable httpd
systemctl start httpd