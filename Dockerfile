FROM openjdk:8-jre-alpine
USER root
MAINTAINER rashmit.rathod@gmail.com
ADD /var/lib/jenkins/workspace/gcr push/target/springboot-hello-world-1.0.jar /opt/
RUN chmod 777 /opt/springboot-hello-world-1.0.jar
CMD ["java","-jar","/opt/springboot-hello-world-1.0.jar"]
