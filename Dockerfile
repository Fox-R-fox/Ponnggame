# Use a JDK image that includes JavaFX
FROM bellsoft/liberica-openjfx:17

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Run the application with JavaFX modules
CMD ["java", "-jar", "pong-game.jar"]
