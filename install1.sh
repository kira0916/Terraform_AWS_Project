#! /bin/bash
sudo su -
cd 
yum update -y
amazon-linux-extras install docker -y
amazon-linux-extras enable docker
systemctl enable docker
systemctl start docker
docker pull tomcat:9.0
mkdir /root/docker_tomcat
cd /root/docker_tomcat
touch /root/docker_tomcat/Dockerfile
cat >> /root/docker_tomcat/Dockerfile << EOF

From tomcat:9.0

RUN apt-get update
RUN apt-get -y install vim wget net-tools apt-utils git
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.30.tar.gz
RUN tar xvfz mysql-connector-java-8.0.30.tar.gz
RUN cp -a /usr/local/tomcat/mysql-connector-java-8.0.30/mysql-connector-java-8.0.30.jar /opt/java/openjdk/
RUN cp -a /usr/local/tomcat/mysql-connector-java-8.0.30/mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib/

RUN sed -i '31 i <Resource name="jdbc/db"' /usr/local/tomcat/conf/context.xml
RUN sed -i '32 i auth="Container"' /usr/local/tomcat/conf/context.xml
RUN sed -i '33 i type="javax.sql.DataSource"' /usr/local/tomcat/conf/context.xml
RUN sed -i '34 i username="admin"' /usr/local/tomcat/conf/context.xml
RUN sed -i '35 i password="It1234567!"' /usr/local/tomcat/conf/context.xml
RUN sed -i '36 i driverClassName="com.mysql.jdbc.Driver"' /usr/local/tomcat/conf/context.xml
RUN sed -i '37 i url="jdbc:mysql://10.0.0.52:3306/db"' /usr/local/tomcat/conf/context.xml
RUN sed -i '38 i maxActive="15"' /usr/local/tomcat/conf/context.xml
RUN sed -i '39 i maxIdle="3"/>' /usr/local/tomcat/conf/context.xml

RUN sed -i '4731 i<resource-ref>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4732 i <res-ref-name>jdbc/db</res-ref-name>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4733 i <res-type>javax.sql.DataSource</res-type>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4734 i <res-auth>Container</res-auth>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4735 i </resource-ref>' /usr/local/tomcat/conf/web.xml

RUN sed -i '122 i <Connector protocol="AJP/1.3"' /usr/local/tomcat/conf/server.xml
RUN sed -i '123 i address="0.0.0.0"' /usr/local/tomcat/conf/server.xml
RUN sed -i '124 i secretRequired="false"' /usr/local/tomcat/conf/server.xml
RUN sed -i '125 i port="8009"' /usr/local/tomcat/conf/server.xml
RUN sed -i '126 i redirectPort="8443" />' /usr/local/tomcat/conf/server.xml
RUN sed -i '136 s/<Engine name="Catalina" defaultHost="localhost">/<Engine name="Catalina" defaultHost="localhost" jvmRoute="worker1">/g' /usr/local/tomcat/conf/server.xml
RUN rm -rf /usr/local/tomcat/webapps
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps/ROOT 
RUN git clone https://github.com/x1nyub/ROOT.git /usr/local/tomcat/webapps/ROOT

RUN echo '\
if [ "${PS1-}" ]; then\n\
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then\n\
    # The file bash.bashrc already sets the default PS1.\n\
    # PS1='\h:\w\$ '\n\
    if [ -f /etc/bash.bashrc ]; then\n\
      . /etc/bash.bashrc\n\
    fi\n\
  else\n\
    if [ "$(id -u)" -eq 0 ]; then\n\
      PS1='# '\n\
    else\n\
      PS1='$ '\n\
    fi\n\
  fi\n\
fi\n\
\n\
if [ -d /etc/profile.d ]; then\n\
  for i in /etc/profile.d/*.sh; do\n\
    if [ -r $i ]; then\n\
      . $i\n\
    fi\n\
  done\n\
  unset i\n\
fi\n\
JAVA_HOME=/opt/java/openjdk\n\
CATALINA_HOME=/usr/local/tomcat\n\
CLASSPATH=/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar\n\
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/bin:/sbin\n\
export JAVA_HOME PATH CLASSPATH CATALINA_HOME\n\
'> /etc/profile

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]

#finish
EOF

docker build -t tom:1 .


mkdir /root/docker_tomcat2
cd /root/docker_tomcat2
touch /root/docker_tomcat2/Dockerfile
cat >> /root/docker_tomcat2/Dockerfile << EOF

From tomcat:9.0

RUN apt-get update
RUN apt-get -y install vim wget net-tools apt-utils git
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.30.tar.gz
RUN tar xvfz mysql-connector-java-8.0.30.tar.gz
RUN cp -a /usr/local/tomcat/mysql-connector-java-8.0.30/mysql-connector-java-8.0.30.jar /opt/java/openjdk/
RUN cp -a /usr/local/tomcat/mysql-connector-java-8.0.30/mysql-connector-java-8.0.30.jar /usr/local/tomcat/lib/

RUN sed -i '31 i <Resource name="jdbc/db"' /usr/local/tomcat/conf/context.xml
RUN sed -i '32 i auth="Container"' /usr/local/tomcat/conf/context.xml
RUN sed -i '33 i type="javax.sql.DataSource"' /usr/local/tomcat/conf/context.xml
RUN sed -i '34 i username="admin"' /usr/local/tomcat/conf/context.xml
RUN sed -i '35 i password="It1234567!"' /usr/local/tomcat/conf/context.xml
RUN sed -i '36 i driverClassName="com.mysql.jdbc.Driver"' /usr/local/tomcat/conf/context.xml
RUN sed -i '37 i url="jdbc:mysql://10.0.0.52:3306/db"' /usr/local/tomcat/conf/context.xml
RUN sed -i '38 i maxActive="15"' /usr/local/tomcat/conf/context.xml
RUN sed -i '39 i maxIdle="3"/>' /usr/local/tomcat/conf/context.xml

RUN sed -i '4731 i <resource-ref>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4732 i <res-ref-name>jdbc/db</res-ref-name>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4733 i <res-type>javax.sql.DataSource</res-type>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4734 i <res-auth>Container</res-auth>' /usr/local/tomcat/conf/web.xml
RUN sed -i '4735 i </resource-ref>' /usr/local/tomcat/conf/web.xml

RUN sed -i '122 i <Connector protocol="AJP/1.3"' /usr/local/tomcat/conf/server.xml
RUN sed -i '123 i address="0.0.0.0"' /usr/local/tomcat/conf/server.xml
RUN sed -i '124 i secretRequired="false"' /usr/local/tomcat/conf/server.xml
RUN sed -i '125 i port="8010"' /usr/local/tomcat/conf/server.xml
RUN sed -i '126 i redirectPort="8443" />' /usr/local/tomcat/conf/server.xml
RUN sed -i '136 s/<Engine name="Catalina" defaultHost="localhost">/<Engine name="Catalina" defaultHost="localhost" jvmRoute="worker2">/g' /usr/local/tomcat/conf/server.xml
RUN rm -rf /usr/local/tomcat/webapps
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps/ROOT 
RUN git clone https://github.com/x1nyub/ROOT.git /usr/local/tomcat/webapps/ROOT
RUN echo '\
if [ "${PS1-}" ]; then\n\
  if [ "${BASH-}" ] && [ "$BASH" != "/bin/sh" ]; then\n\
    # The file bash.bashrc already sets the default PS1.\n\
    # PS1='\h:\w\$ '\n\
    if [ -f /etc/bash.bashrc ]; then\n\
      . /etc/bash.bashrc\n\
    fi\n\
  else\n\
    if [ "$(id -u)" -eq 0 ]; then\n\
      PS1='# '\n\
    else\n\
      PS1='$ '\n\
    fi\n\
  fi\n\
fi\n\
\n\
if [ -d /etc/profile.d ]; then\n\
  for i in /etc/profile.d/*.sh; do\n\
    if [ -r $i ]; then\n\
      . $i\n\
    fi\n\
  done\n\
  unset i\n\
fi\n\
JAVA_HOME=/opt/java/openjdk\n\
CATALINA_HOME=/usr/local/tomcat\n\
CLASSPATH=/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar\n\
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/bin:/bin:/sbin\n\
export JAVA_HOME PATH CLASSPATH CATALINA_HOME\n\
'> /etc/profile

EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]

#finish
EOF

docker build -t tom:2 .

alias tomcat1="docker exec -it tomcat1 bash"
alias tomcat2="docker exec -it tomcat2 bash"

docker run -itd --name tomcat1 -p 8009:8009 tom:1 /bin/bash
docker run -itd --name tomcat2 -p 8010:8010 tom:2 /bin/bash
