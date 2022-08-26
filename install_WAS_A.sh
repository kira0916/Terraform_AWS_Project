#! /bin/bash
sudo su -
yum update -y
amazon-linux-extras install docker -y
amazon-linux-extras enable docker
systemctl enable docker
systemctl start docker
docker swarm init
mkdir /SwarmToken
cd /SwarmToken
docker swarm join-token manager > /SwarmToken/SwarmToken.sh
sed -i '1 d' /SwarmToken/SwarmToken.sh
sed -i '1 d' /SwarmToken/SwarmToken.sh
sed -i '2 d' /SwarmToken/SwarmToken.sh
yum install -y git
git config --global user.name "x1nyub"
git config --global user.email "conan0333@gmail.com"
git init
git add *
git commit -m "1"
git branch -M main
git push --set-upstream https://x1nyub:/x1nyub/NodeToken2.git main
docker pull heeyoonchai/tom:5
