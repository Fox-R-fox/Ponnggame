FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the JAR file created by Maven
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Install JavaFX dependencies
RUN apt-get update && apt-get install -y libopenjfx-java

# Run the game
CMD ["java", "-jar", "pong-game.jar"]
