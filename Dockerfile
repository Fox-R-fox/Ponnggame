FROM bellsoft/liberica-full:17

WORKDIR /app

# Install Xvfb for a virtual display
RUN apt-get update && apt-get install -y xvfb

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Start a virtual display & run the application
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x24 & java -Djava.awt.headless=false -Dprism.verbose=true -Dglass.platform=Monocle -Dmonocle.platform=Headless -jar /app/pong-game.jar"]
