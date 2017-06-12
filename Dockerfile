FROM tomcat:8.0-jre8
MAINTAINER Christoph Beger

# MongoDB
RUN apt-get -qq update && apt-get -qq install -y git maven openjdk-8-jdk

# Deployment
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf *
RUN mkdir -p /data/webprotege
RUN git clone https://github.com/protegeproject/webprotege.git

WORKDIR /usr/local/tomcat/webapps/webprotege
RUN mvn -Dmaven.test.skip=true -Pdeployment -Dapplication.hostSupplier=localhost -Ddata.directory=/data/webprotege package
RUN mv target/webprotege-3.0.0-SNAPSHOT.war ../webprotege.war

WORKDIR /usr/local/tomcat/webapps
RUN unzip -q webprotege.war -d ROOT && rm webprotege.war
RUN rm webprotege -r

# Add properties file to webprotege webapps folder
RUN touch ROOT/webprotege.properties
RUN echo \
  webprotege.data.directory=/data/webprotege"\n" \
  webprotege.application.host=localhost"\n" \
  > ROOT/webprotege.properties
RUN echo "\n"mongodb.host=mongodb"\n" >> ROOT/WEB-INF/classes/webprotege.properties

EXPOSE 8080

CMD catalina.sh run