FROM eclipse-temurin:17-jdk

# Create and set working directory
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y xvfb && rm -rf /var/lib/apt/lists/*

# Ensure target directory exists before copying
RUN mkdir -p /app

# Copy JAR (make sure the file exists!)
COPY target/*.jar /app/pong-game.jar

# Ensure the JAR has execute permissions
RUN chmod +x /app/pong-game.jar

# Run the application
CMD ["xvfb-run", "-a", "java", "-jar", "/app/pong-game.jar"]
