FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Install necessary dependencies (JavaFX and any other required libraries)
RUN apt-get update && apt-get install -y openjfx && rm -rf /var/lib/apt/lists/*

# Copy the JAR file into the container
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Expose the application's port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/app/pong-game.jar"]
