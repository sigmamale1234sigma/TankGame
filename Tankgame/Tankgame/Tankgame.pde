
// Jonas Kirkham | 1 April 2026 | TankGame
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Obstacle o1;
Obstacle o2;
Obstacle o3;
PImage bg;
int score;
Timer objTimer, puTimer;
boolean upPressed, downPressed, leftPressed, rightPressed;
boolean playingss=false;

void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("Background.png");
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  if(playingss==true){
 run();
  }else{
    background(0);
    fill(#0CB2C6);
    textSize(50);
    text("LIL TANKY GAME",100,250);
    textSize(40);
    text("To start : press space",CENTER ,300);
    if (key == ' '){
      playingss=true;
      
    }
    
  }
}
void run(){
   background(bg);

  if (objTimer.isFinished()) {
    float spawnX = random(50, width - 50);
    float spawnY = random(50, height - 50);
    obstacles.add(new Obstacle(spawnX, spawnY, 100, 50, int(random(1, 4)), 100));
    objTimer.start();
  }

  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer.start();
  }

  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);

    // projectile vs obstacle
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score += 100;
        projectiles.remove(i);
        obstacles.remove(j);
        i--;
        break;
      }
    }

    p.display();
    p.move();

    if (p.reachedEdge()) {
      projectiles.remove(i);
      i--;
    }
  }

  for (int j = 0; j < powerups.size(); j++) {
    PowerUp pu = powerups.get(j);
    pu.display();
    pu.move();

    if (pu.reachedEdge()) {
      powerups.remove(j);
      j--;
      continue;
    }

    if (pu.intersect(t1)) {
      t1.health += 10;
      powerups.remove(j);
      j--;
    }
  }

  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();

    if (t1.intersects(o)) {
      t1.takeDamage(10);
    }
  }

  if (upPressed)    t1.y -= t1.speed;
  if (downPressed)  t1.y += t1.speed;
  if (leftPressed)  t1.x -= t1.speed;
  if (rightPressed) t1.x += t1.speed;


  t1.faceMouse();

  scorePanel();
  fill(255);
  textSize(20);
  text("Health: " + t1.health, 60, 18);

  if (t1.health <= 0) {
    background(0);
    fill(255, 0, 0);
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
}

  
  

void keyPressed() {
  if (key == 'w') upPressed = true;
  if (key == 's') downPressed = true;
  if (key == 'a') leftPressed = true;
  if (key == 'd') rightPressed = true;
}

void keyReleased() {
  if (key == 'w') upPressed = false;
  if (key == 's') downPressed = false;
  if (key == 'a') leftPressed = false;
  if (key == 'd') rightPressed = false;
}


void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 10, width, 20);
  fill(255);
  text("Score:" + score, width/2, 15);
}
