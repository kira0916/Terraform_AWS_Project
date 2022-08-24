#! /bin/bash
sudo su -
yum update -y
amazon-linux-extras install docker -y
amazon-linux-extras enable docker
systemctl enable docker
systemctl start docker
docker pull heeyoonchai/tomcat:2
yum install -y git
sleep 10
git clone https://github.com/x1nyub/test1.git
cd test1
chmod 777 test.sh
./test.sh
docker service create --name tomcat -p 8009:8009 --dns=8.8.8.8 --replicas 4 heeyoonchai/tomcat:2
