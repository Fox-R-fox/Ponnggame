FROM openjdk:17-jdk-slim
WORKDIR /app
ARG JAR_FILE
COPY ${JAR_FILE} /app/pong-game.jar
RUN apt-get update && apt-get install -y libopenjfx-java
CMD ["java", "-jar", "pong-game.jar"]
