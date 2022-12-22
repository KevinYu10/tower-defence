class AoeTower {

  float x, y;
  int cooldown, threshold;
  int towerMode;
  final int placing  = 0;
  final int placed   = 1;
  float circleD;

  AoeTower(float _x, float _y) {
    x = _x;
    y = _y;
    cooldown = 0;
    threshold = 80;
    circleD = 300;
    towerMode = placing;
  }

  void show() {
    fill(yellow);
    stroke(0);
    strokeWeight(3);
    if (towerMode == placed) {
      circle(x, y, 40);
    } else if (towerMode == placing) {
      circle(mouseX, mouseY, 40);
      if (mousePressed) {
        towerMode = placed;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void act() {
    cooldown++;
    if (cooldown >= threshold) {
      cooldown = 0;
      if (mobs.size() > 0) {
        fill(255);
        noStroke();
        circle(x, y, circleD);
      }
      if (mobs.size() > 0) {
        int i = 0;
        while (i < mobs.size()) {
          if (dist(mobs.get(i).x, mobs.get(i).y, x, y) <= circleD/2+mobs.get(i).d/2) {
            mobs.get(i).mobLives--;
            i++;
          } else {
            i++;
          }
        }
      }
    }
  }
}
