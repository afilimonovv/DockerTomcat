#FROM ubuntu:18.04
apt-get update -y
apt-get install docker -y
apt-get install maven -y
docker pull tomcat
docker run -it --rm - 8888:8080 tomcat:9.0 \
  --restart always \
  --volume $CATALINA_BASE:/usr/local/tomcat \
  --volume $CATALINA_HOME:/usr/local/tomcat \
  --volume $CATALINA_TMPDIR:/usr/local/tomcat/temp \
  --volume $JRE_HOME:/usr \
  --volume $CLASSPATH:/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat-juli.jar \
  --shm-size 256m
EXPOSE 8888

