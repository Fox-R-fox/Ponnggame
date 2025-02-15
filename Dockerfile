FROM eclipse-temurin:17-jdk

WORKDIR /app

# Install JavaFX
RUN apt-get update && apt-get install -y openjfx

# Copy the JAR
COPY target/*.jar /app/pong-game.jar

# Run the JAR
CMD ["java", "--module-path", "/usr/share/openjfx/lib", "--add-modules", "javafx.controls", "-jar", "/app/pong-game.jar"]
