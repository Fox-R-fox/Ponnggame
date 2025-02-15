FROM bellsoft/liberica-runtime-full:17

WORKDIR /app

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Run the application with JavaFX modules
CMD ["java", "--module-path", "/app/javafx-sdk/lib", "--add-modules", "javafx.controls,javafx.fxml", "-jar", "/app/pong-game.jar"]
