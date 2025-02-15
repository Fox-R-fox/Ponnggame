FROM openjdk:17-slim  

WORKDIR /app  

# Install dependencies
RUN apt-get update && apt-get install -y \
    libgl1 libgtk-3-0 libxtst6 libxrender1 libfontconfig1 libxi6 libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*  

# Download and install JavaFX SDK
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://download2.gluonhq.com/openjfx/17.0.2/openjfx-17.0.2_linux-x64_bin-sdk.zip \
    && unzip openjfx-17.0.2_linux-x64_bin-sdk.zip -d /opt \
    && rm openjfx-17.0.2_linux-x64_bin-sdk.zip \
    && apt-get remove -y wget unzip \
    && apt-get autoremove -y  

# Set JavaFX module path
ENV PATH_TO_FX=/opt/javafx-sdk-17.0.2/lib  

# Copy the JAR file
COPY target/pong-game-1.0-SNAPSHOT.jar /app/pong-game.jar  

# Run the application with JavaFX modules
CMD ["java", "--module-path", "/opt/javafx-sdk-17.0.2/lib", "--add-modules", "javafx.controls,javafx.fxml", "-jar", "/app/pong-game.jar"]
