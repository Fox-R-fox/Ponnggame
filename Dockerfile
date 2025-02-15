FROM openjdk:17-slim

WORKDIR /app

# Install required dependencies for JavaFX
RUN apt-get update && apt-get install -y \
    libgl1 \
    libgtk-3-0 \
    libxtst6 \
    libxrender1 \
    libfontconfig1 \
    libxi6 \
    libglu1-mesa \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

# Download and extract JavaFX SDK
RUN wget https://download2.gluonhq.com/openjfx/17/openjfx-17_linux-x64_bin-sdk.zip \
    && unzip openjfx-17_linux-x64_bin-sdk.zip -d /opt \
    && rm openjfx-17_linux-x64_bin-sdk.zip

# Set JavaFX module path
ENV PATH_TO_FX="/opt/javafx-sdk-17/lib"

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar

# Ensure Java runs correctly with JavaFX
CMD ["sh", "-c", "java --module-path $PATH_TO_FX --add-modules javafx.controls,javafx.fxml -jar /app/pong-game.jar"]
