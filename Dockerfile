FROM openjdk:8-jre-alpine
USER root
MAINTAINER rashmit.rathod@gmail.com
COPY /var/lib/jenkins/.m2/repository/com/example/helloworld/springboot-hello-world/1.0/springboot-hello-world-1.0.jar /opt/
RUN chmod 777 /opt/springboot-hello-world-1.0.jar
CMD ["java","-jar","/opt/springboot-hello-world-1.0.jar"]
