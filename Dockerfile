FROM eclipse-temurin:17-jdk

WORKDIR /app

RUN apt-get update && apt-get install -y xvfb && rm -rf /var/lib/apt/lists/*

COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/pong-game.jar"]
