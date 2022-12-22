class SniperTower {

  float x, y;
  int towerMode;
  final int placing = 0;
  final int placed = 1;
  color shootingColor;
  float shootingArray;
  int shootingCooldown, shootingCountdown;
  float angle;


  SniperTower(float _x, float _y) {
    x = _x;
    y = _y;
    towerMode = placing;
    shootingColor = white;
    shootingArray = 1;
    shootingCooldown = 60;
  }

  void show() {

    if (towerMode == placed) {
      sniper(x, y);
    } else if (towerMode == placing) {
      sniper(mouseX, mouseY);
      if (mousePressed) {
        towerMode = placed;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void act() {
    if (towerMode == placed && mobs.size() > 0 && mobs.get(0).x>0) {
      stroke(shootingColor);
      strokeWeight(shootingArray);
      line(mobs.get(0).x, mobs.get(0).y, x, y);
      if (shootingCountdown >= shootingCooldown) {
        shootingCountdown = 0;
        shootingArray = 0;
        mobs.get(0).mobLives-=2;
      } else {
        shootingArray+=0.08;
        shootingCountdown++;
        shootingColor = white;
      }
      if (shootingCountdown >= shootingCooldown-10) {
        shootingColor = red;
      } else {
        shootingColor = white;
      }
    }
    //if(mobs.size()>0)  println(mobs.get(0).mobMode);
  }

  void sniper(float x, float y) {
    if (mobs.size()>0) {
      angle = atan2(mobs.get(0).y - y, mobs.get(0).x - x);
    }
    pushMatrix();
    translate(x, y);
    if (towerMode == placed && mobs.size()>0) {
      rotate(angle+PI/2);
    }
    stroke(white);
    strokeWeight(10);
    line(0, 2, 0, -18);
    fill(black);
    stroke(white);
    strokeWeight(3);
    triangle(0, 0, -20, 35, 20, 35);
    popMatrix();
  }
}
