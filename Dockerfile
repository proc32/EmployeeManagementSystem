# Dockerfile
FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/employee-management-system-1.0-SNAPSHOT.jar .
CMD ["java", "-jar", "employee-management-system-1.0-SNAPSHOT.jar"]
