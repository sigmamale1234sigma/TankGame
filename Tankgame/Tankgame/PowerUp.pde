class PowerUp {
  float x, y, w, h, speed;
  PImage HB;
  char type;

  PowerUp() {
    w = 50;
    h = 50;
    speed = 2;
    HB = loadImage("heart2.png");
    

    // ALWAYS spawn a health powerup
    type = 'h';

    // spawn at top of screen
    x = random(50, width - 50);
    y = -50;
  }

  void display() {
    if (type == 'h') {
      imageMode(CENTER);
      image(HB, x, y);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedEdge() {
    return (y > height + 50);
  }

  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    return distance < 50;
  }
}
