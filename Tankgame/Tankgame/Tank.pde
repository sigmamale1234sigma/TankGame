class Tank {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankD, iTankS;
  char idir;
  int damageCooldown = 0;

  // Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 7.0;
    health = 100;
    iTankS = loadImage("tank3.png");
    iTankA = loadImage("tank2.png");
    iTankD = loadImage("tank4.png");
    iTankW = loadImage("tank1.png");
    idir = 'w';
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
    } else if (idir == 'a') {
      image(iTankA, x, y);
    } else if (idir == 'd') {
      image(iTankD, x, y);
    } else if (idir == 's') {
      image(iTankS, x, y);
    }
    if (damageCooldown > 0) {
      damageCooldown--;
    }
  }
  
  void faceMouse() {
  float angle = atan2(mouseY - y, mouseX - x);

  // rotate tank
  pushMatrix();
  translate(x, y);
  rotate(angle + HALF_PI);
  imageMode(CENTER);
  image(iTankW, 0, 0);
  popMatrix();

  // cooldown tick
  if (damageCooldown > 0) {
    damageCooldown--;
  }
}


  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }

  void fire() {
  }

  boolean intersects(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);

    return distance < (w/2 + o.w/2);
  }

  void takeDamage(int amount) {
    if (damageCooldown <= 0) {
      health -= amount;
      damageCooldown = 20;
    }
  }
}
