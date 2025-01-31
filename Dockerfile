# Stage 1: Use a Gradle image to build the application
FROM gradle:jdk11 AS build

# Set the working directory inside the container
WORKDIR /demo-ci-cd

# Copy the project files to the container
COPY . .

# Make Gradle wrapper executable
RUN chmod +x gradlew

# Run Gradle to ensure it's set up correctly (optional but useful for debugging)
RUN ./gradlew --version

# Build the application
RUN ./gradlew clean build

# Verify that the JAR file was created successfully
RUN ls -l /demo-ci-cd/build/libs

# Stage 2: Use a lightweight OpenJDK image to run the application
FROM openjdk:11-jre-slim

# Set the working directory for the runtime image
WORKDIR /demo-ci-cd

# Copy the built JAR file from the build stage
COPY --from=build /demo-ci-cd/build/libs/*.jar 0.0.1-SNAPSHOT.jar

# Expose the application port
EXPOSE 8082

# Verify the contents of the directory (useful for debugging)
RUN ls -l /demo-ci-cd

# Run the application
CMD ["java", "-jar", "0.0.1-SNAPSHOT.jar"]
