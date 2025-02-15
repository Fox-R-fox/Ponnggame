FROM openjdk:17-slim

WORKDIR /app

# Install JavaFX dependencies
RUN apt-get update && apt-get install -y openjfx libopenjfx-java

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Run the application
CMD ["java", "-jar", "/app/pong-game.jar"]
