FROM ubuntu:latest as build

WORKDIR /home/spring

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN apt-get install maven -y

RUN mvn dependency:go-offline

RUN ls

# RUN mvn clean install

# RUN mvn package

#FROM openjdk:17-jdk-slim
#EXPOSE 8080
#COPY --from=build /target/todolist-1.0.0.jar app.jar
#ENTRYPOINT ["java","-jar","app.jar"]


# docker build -t rogeriofonseca/tomcat-server:1.0 .
# && docker run -p 8383:8080 — rm -it rogeriofonseca/tomcat-server:1.0


#FROM maven:4.0.0-jdk-17-slim AS build
#WORKDIR /home/build
##RUN apt-get update
##RUN apt-get install openjdk-17-jdk -y
#COPY . .
#
##RUN apt-get install maven -y
#RUN mvn -f /home/build/pom.xml clean package
#
#
#FROM openjdk:17-jdk-slim
#WORKDIR /home/prod
#EXPOSE 8080
#COPY --from=build /build/target/todolist-1.0.0.jar /home/prod/app.jar
#ENTRYPOINT ["java","-jar","app.jar"]
