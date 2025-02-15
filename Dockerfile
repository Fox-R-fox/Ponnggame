FROM eclipse-temurin:17-jdk

WORKDIR /app

# Install Xvfb
RUN apt-get update && apt-get install -y xvfb && rm -rf /var/lib/apt/lists/*

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Run the application with Xvfb
CMD xvfb-run -a java -jar /app/pong-game.jar
