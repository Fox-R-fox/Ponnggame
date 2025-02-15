package com.pong;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

public class Ball {
    private double x, y;
    private double size;
    private Color color;
    private double xSpeed = 3, ySpeed = 3;

    public Ball(double x, double y, double size, Color color) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.color = color;
    }

    public void update() {
        x += xSpeed;
        y += ySpeed;

        if (y < 0 || y + size > 600) ySpeed *= -1;
    }

    public void checkCollision(Paddle playerPaddle, Paddle aiPaddle) {
        if (x < playerPaddle.getX() + playerPaddle.getWidth() && y > playerPaddle.getY() && y < playerPaddle.getY() + playerPaddle.getHeight()) {
            xSpeed *= -1;
        }
        if (x + size > aiPaddle.getX() && y > aiPaddle.getY() && y < aiPaddle.getY() + aiPaddle.getHeight()) {
            xSpeed *= -1;
        }
    }

    public void render(GraphicsContext gc) {
        gc.setFill(color);
        gc.fillOval(x, y, size, size);
    }

    public double getX() { return x; }
    public double getY() { return y; }
}