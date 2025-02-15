FROM openjdk:17

WORKDIR /app

# Install JavaFX
RUN apt-get update && apt-get install -y openjfx libopenjfx-java

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Run the application
CMD ["java", "-jar", "/app/pong-game.jar"]
