#! /bin/bash
sudo su -
yum update -y
amazon-linux-extras install docker -y
amazon-linux-extras enable docker
systemctl enable docker
systemctl start docker
docker swarm init
mkdir /test
cd /test
docker swarm join-token manager > /test/test.sh
sed -i '1 d' /test/test.sh
sed -i '1 d' /test/test.sh
sed -i '2 d' /test/test.sh
yum install -y git
git config --global user.name "x1nyub"
git config --global user.email "conan0333@gmail.com"
git init
git add *
git commit -m "1"
git branch -M main
git push --set-upstream https://x1nyub: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@github.com/x1nyub/test1.git main
docker pull heeyoonchai/tomcat:1
