//bullet that tower shoots and deal
//damage to mobs
class Bullet {

  float x, y, vx, vy, d;
  int lives;

  Bullet(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    lives = 1;
    d = 20;
  }

  void show() {
    fill(255);
    stroke(0);
    strokeWeight(3);
    circle(x, y, d);
  }

  void act() {
    x += vx;
    y += vy;

    if (x < 0 && x > width && y < 0 && y > height) {
      bullets.remove(0);
    }

    if (lives <= 0) {
      bullets.remove(0);
    }

    int i = 0;
    while (i<mobs.size()) {
      Mob mob = mobs.get(i);
      if (dist(mob.x, mob.y, x, y) < d/2+mob.d/2) {
        mob.mobLives -= 1;
        lives = lives - 1;
      }
      i++;
    }
  }
}
