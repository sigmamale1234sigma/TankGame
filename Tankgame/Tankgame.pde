//Jonas Kirkham | Apr 14 2026 | TankGame
PImage bg;
Tank beezlebubbers;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
int score;


void setup() {
  size(500, 500);
  bg = loadImage("gamebackground.png");
  beezlebubbers = new Tank();
  obstacles.add(new Obstacle(250, 250));
  obstacles.add(new Obstacle(25, 400));
  obstacles.add(new Obstacle(325, 100));
  score = 0;
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  beezlebubbers.display();
  //displaying obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = obstacles.get(i);
    obs.display();
    obs.move();
       scorePanel();
  }
  //displaying projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
       scorePanel();
  }
}

void scorePanel() {
  fill(127,127);
  rectMode(CENTER);
  rect(width/2,30,width,60);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score,width/2,50);

}



void keyPressed() {
  if (key == 'w') {
    beezlebubbers.move('w');
  } else if (key == 's') {
    beezlebubbers.move('s');
  } else if (key == 'a') {
    beezlebubbers.move ('a');
  } else if (key == 'd') {
    beezlebubbers.move('d');
  }
}

void mousePressed() {
    projectiles.add(new Projectile(beezlebubbers.x, beezlebubbers.y));
}
