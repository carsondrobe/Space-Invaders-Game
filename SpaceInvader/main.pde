float ship_x = 0, ship_y = 375;
float bullet_x = 0, bullet_y = 375;
boolean bullet_active = false;
float enemy_x = 200, enemy_y = 0, enemy_size = 40, bullet_len = 10;
int score = 0;
PImage spaceship, bullet, bg, enemy;
void setup() {
  size(400, 400);
  stroke(255);
  strokeWeight(3);
  spaceship = loadImage("spaceship.png");
  bullet = loadImage("bullet.png");
  bg = loadImage("bg.jpeg");
  enemy = loadImage("enemy.png");
}
void draw() {
  imageMode(CENTER);
  background(bg);
  text("Score: " + score, 20, 20); //game loop
  moveSpaceship();
  moveBullet();
  moveEnemey();
  detectCollisions();
  displayBullet();
  displaySpaceship();
  displayEnemy();
}
void moveSpaceship() {
  ship_x = mouseX;
}
void moveEnemey() {
  enemy_y+= 0.3;
  enemy_x = 200+100*sin(map(enemy_y, 0, height, 0, 8*PI));
}

void moveBullet() {
  if (bullet_active) {
    bullet_y-=6;
    if (bullet_y<0) {
      bullet_active = false;
      bullet_x = ship_x;
      bullet_y = ship_y;
    }
  } else {
    bullet_x = ship_x;
    bullet_y = ship_y;
  }
}
void displaySpaceship() {
  image(spaceship, ship_x, ship_y, 50, 50);
}
void displayBullet() {
  image(bullet, bullet_x, bullet_y, 10, 25);
}
void displayEnemy() {
  image(enemy, enemy_x, enemy_y, 50, 50);
}
void detectCollisions() {
  if (dist(bullet_x, bullet_y, enemy_x, enemy_y)<enemy_size/2) {
    score++;
    bullet_active = false;
  }
}
void mouseReleased() {
  bullet_active = true;
}
