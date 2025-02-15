# Use JDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Ensure the pong-game.jar file is available in the 'target' directory (after Maven build)
COPY target/pong-game.jar /app

# Install JavaFX dependencies (required if using JavaFX in your app)
RUN apt-get update && apt-get install -y libopenjfx-java

# Command to run the game
CMD ["java", "-jar", "pong-game.jar"]
