FROM eclipse-temurin:17-jdk

WORKDIR /app

# Install required packages for JavaFX and Xvfb
RUN apt-get update && apt-get install -y \
    xvfb \
    libgl1-mesa-glx \
    libxrender1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the JAR file into the container
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Set the entrypoint to run the application
ENTRYPOINT ["xvfb-run", "-a", "java", "-jar", "/app/pong-game.jar"]
