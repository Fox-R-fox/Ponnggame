package com.pong;

import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class PongGame extends Application {
    private static final int WIDTH = 800;
    private static final int HEIGHT = 600;
    private Paddle playerPaddle;
    private Paddle aiPaddle;
    private Ball ball;
    private boolean upPressed, downPressed;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        Canvas canvas = new Canvas(WIDTH, HEIGHT);
        GraphicsContext gc = canvas.getGraphicsContext2D();

        playerPaddle = new Paddle(10, HEIGHT / 2 - 50, 10, 100, Color.BLUE);
        aiPaddle = new Paddle(WIDTH - 20, HEIGHT / 2 - 50, 10, 100, Color.RED);
        ball = new Ball(WIDTH / 2, HEIGHT / 2, 10, Color.WHITE);

        Scene scene = new Scene(new StackPane(canvas));
        scene.setOnKeyPressed(e -> {
            if (e.getCode() == KeyCode.UP) upPressed = true;
            if (e.getCode() == KeyCode.DOWN) downPressed = true;
        });
        scene.setOnKeyReleased(e -> {
            if (e.getCode() == KeyCode.UP) upPressed = false;
            if (e.getCode() == KeyCode.DOWN) downPressed = false;
        });

        primaryStage.setTitle("Pong Game");
        primaryStage.setScene(scene);
        primaryStage.show();

        new AnimationTimer() {
            @Override
            public void handle(long now) {
                update();
                render(gc);
            }
        }.start();
    }

    private void update() {
        if (upPressed) playerPaddle.moveUp();
        if (downPressed) playerPaddle.moveDown();
        ball.update();
        ball.checkCollision(playerPaddle, aiPaddle);
        aiPaddle.aiMove(ball);
    }

    private void render(GraphicsContext gc) {
        gc.setFill(Color.BLACK);
        gc.fillRect(0, 0, WIDTH, HEIGHT);
        playerPaddle.render(gc);
        aiPaddle.render(gc);
        ball.render(gc);
    }
}