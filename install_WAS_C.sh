#! /bin/bash
sudo su -
yum update -y
amazon-linux-extras install docker -y
amazon-linux-extras enable docker
systemctl enable docker
systemctl start docker
docker pull heeyoonchai/tom:5
yum install -y git
sleep 10
git clone https://github.com/x1nyub/NodeToken2.git
cd NodeToken2
chmod 777 SwarmToken.sh
./NodeToken2
docker service create --name tomcat -p 8080:8080 --dns=8.8.8.8 --replicas 2 heeyoonchai/tom:5
