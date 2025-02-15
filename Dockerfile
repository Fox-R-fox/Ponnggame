FROM azul/zulu-openjdk:17

WORKDIR /app

# Copy the built JAR file into the container
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Run the application
CMD ["java", "-jar", "pong-game.jar"]
