# Use JDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the compiled Java game and resources
COPY target/pong-game.jar /app

# Install JavaFX dependencies
RUN apt-get update && apt-get install -y libopenjfx-java

# Run the game
CMD ["java", "-jar", "pong-game.jar"]