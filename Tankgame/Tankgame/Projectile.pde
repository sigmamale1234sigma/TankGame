class Projectile {
  // member variables
  float x, y, w, h, speed;
  float vx, vy;
  char dir;

  // constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = 10;
    this.h = 10;
    speed = 10;
    dir = 'u';
  }

  void display() {
    fill(255, 255, 0);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedEdge() {
    if (x>width || x < -101 || y>height || y<0) {
      return true;
    } else {
      return false;
    }
  }
}
