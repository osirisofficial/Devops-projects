FROM eclipse-temurin:17-jdk-alpine AS base

WORKDIR /APP

COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar" , "app.jar" ]