//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class GunTower {

  float x, y;
  int cooldown, threshold, towerMode;
  final int placing = 0;
  final int placed  = 1;

  GunTower(float _x, float _y) {
    x = _x;
    y = _y;
    cooldown = 0;
    threshold = 30;
    towerMode = placing;
  }

  void show() {
    fill(255);
    stroke(0);
    strokeWeight(3);
    if (towerMode == placed) {
      square(x, y, 40);
    } else if (towerMode == placing) {
      square(mouseX, mouseY, 40);
      if (mousePressed) {
        towerMode = placed;
        x = mouseX;
        y = mouseY;
      }
    }
  }




  void act() {
    cooldown++;
    while (cooldown >= threshold) {
      cooldown = 0;
      if (mobs.size() > 0 && mobs.get(0).x > 0) {
        bullets.add(new Bullet(x, y, 0, -10)); // UP
        bullets.add(new Bullet(x, y, 0, 10));  //DOWN
        bullets.add(new Bullet(x, y, -10, 0)); //LEFT
        bullets.add(new Bullet(x, y, 10, 0));  //RIGHT
      }
    }
    //println(cooldown);
    //println(threshold);
  }
}
