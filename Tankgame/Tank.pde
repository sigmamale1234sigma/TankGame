class Tank {
  int x, y, w, h, speed, health;
  PImage t1w, t1a, t1s, t1d;
  char idir;


  // Constructor
  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 4;
    health = 100;
    t1w = loadImage("tank1.png");
    t1a = loadImage("tank2.png");
    t1s = loadImage("tank3.png");
    t1d = loadImage("tank4.png");
    idir= 'w';
  }
  void display() {
    imageMode(CENTER);
    if (idir =='w') {
      image(t1w, x, y);
    } else if (idir =='a') {
      image(t1a, x, y);
    } else if (idir == 's') {
      image(t1s, x, y);
    } else if (idir == 'd') {
      image(t1d, x, y);
    }
  }

void move(char dir) {
  if (dir == 'w') {
    idir ='w';
    y = y - speed;
  } else if (dir == 's') {
    idir = 's';
    y = y + speed;
  } else if (dir == 'a') {
    idir = 'a';
    x = x - speed;
  } else if (dir =='d') {
    idir = 'd';
    x = x + speed;
  }
}
}
