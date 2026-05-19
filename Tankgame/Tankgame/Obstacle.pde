class Obstacle {
  // member variables
  float x, y, w, h, speed, health;
  PImage obs1;
  char idir;
  float vx, vy;
  int changeTimer = 0;

  // constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    idir = 'w';
    obs1 = loadImage ("obstacle.png");

    float angle = random(TWO_PI);
    vx = cos(angle) * speed;
    vy = sin(angle) * speed;
    changeTimer = int(random(20, 60));
  }

  void display() {
    fill(127);
    imageMode(CENTER);
    image(obs1, x, y);
  }

  void move() {
    if (changeTimer <= 0) {
      float angle = random(TWO_PI);
      vx = cos(angle) * speed;
      vy = sin(angle) * speed;
      changeTimer = int(random(20, 60));
    }

    x += vx;
    y += vy;

    if (x < w/2 || x > width - w/2) {
      vx *= -1;
    }
    if (y < h/2 || y > height - h/2) {
      vy *= -1;
    }

    changeTimer--;
  }

  boolean reachedEdge() {
    if (x>width || x < -101 || y>height || y<0) {
      return true;
    } else {
      return false;
    }
  }
}
