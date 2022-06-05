FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install docker -y
RUN apt-get install maven -y
RUN docker pull tomcat
RUN docker run -it --rm - 8888:8080 tomcat:9.0 \
  --restart always \
  --volume $CATALINA_BASE:/usr/local/tomcat \
  --volume $CATALINA_HOME:/usr/local/tomcat \
  --volume $CATALINA_TMPDIR:/usr/local/tomcat/temp \
  --volume $JRE_HOME:/usr \
  --volume $CLASSPATH:/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat-juli.jar \
  --shm-size 256m
EXPOSE 8888

