FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY target/*.jar myapp.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","myapp.jar"]
