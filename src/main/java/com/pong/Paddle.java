package com.pong;

import javafx.scene.canvas.GraphicsContext;
import javafx.scene.paint.Color;

public class Paddle {
    private double x, y;
    private double width, height;
    private Color color;
    private double speed = 5;

    public Paddle(double x, double y, double width, double height, Color color) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
    }

    public void moveUp() {
        if (y > 0) y -= speed;
    }

    public void moveDown() {
        if (y + height < 600) y += speed;
    }

    public void aiMove(Ball ball) {
        if (ball.getY() < y + height / 2) moveUp();
        if (ball.getY() > y + height / 2) moveDown();
    }

    public void render(GraphicsContext gc) {
        gc.setFill(color);
        gc.fillRect(x, y, width, height);
    }

    public double getX() { return x; }
    public double getY() { return y; }
    public double getWidth() { return width; }
    public double getHeight() { return height; }
}