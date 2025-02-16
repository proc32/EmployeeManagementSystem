# Use OpenJDK as the base image
FROM openjdk:17

# Set working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the project using Maven
RUN apt update && apt install -y maven && mvn clean package -DskipTests

# Copy the built JAR file to a new container to keep it lightweight
FROM openjdk:17
WORKDIR /app
COPY --from=0 /app/target/*.jar app.jar

# Expose the required port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "app.jar"]
