//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, d;
  float vx, vy;
  int direction, mobLives;
  PImage mob;
  int maxhp;
  int mobMode;
  int l;
  final int Standard  = 0;
  final int Chunky    = 1;
  final int Speedy    = 2;
  final int Standard2 = 3;
  final int Chunky2   = 4;
  final int Speedy2   = 5;

  Mob(float _x, float _y, int mode, int level) {
    x = _x;
    y = _y;
    direction = right;
    mobMode = mode;
    if (mobMode == Standard) {
      mobLives = (10*level);
      maxhp = (10*level);
      d = 50;
    } else if (mobMode == Chunky) {
      mobLives = (20*level);
      maxhp = (20*level);
      d = 70;
    } else if (mobMode == Speedy) {
      mobLives = (20*level);
      maxhp = (20*level);
      d = 50;
    }
  }


  void show() {
    if (mobMode == Standard) {
      if (direction == up) {
        vy = -1;
        vx = 0;
      } else if (direction == down) {
        vy = 1;
        vx = 0;
      } else if (direction == left) {
        vx = -1;
        vy = 0;
      } else if (direction == right) {
        vx = 1;
        vy = 0;
      }
    } else if (mobMode == Chunky) {
      if (direction == up) {
        vy = -0.5;
        vx = 0;
      } else if (direction == down) {
        vy = 0.5;
        vx = 0;
      } else if (direction == left) {
        vx = -0.5;
        vy = 0;
      } else if (direction == right) {
        vx = 0.5;
        vy = 0;
      }
    } else if (mobMode == Speedy) {
      if (direction == up) {
        vy = -2;
        vx = 0;
      } else if (direction == down) {
        vy = 2;
        vx = 0;
      } else if (direction == left) {
        vx = -2;
        vy = 0;
      } else if (direction == right) {
        vx = 2;
        vy = 0;
      }
    }

    if (mobMode == Standard) {
      fill(darkBlue);
      stroke(black);
      if (waveLevel == 2) {
      }
      strokeWeight(2);
      circle(x, y, d);
      if (mobLives <= 0) money += 5;
    } else if (mobMode == Chunky) {
      fill(red);
      stroke(yellow);
      if (waveLevel == 2) {
      }
      strokeWeight(2);
      circle(x, y, d);
      if (mobLives <= 0) money += 10;
    } else if (mobMode == Speedy) {
      fill(white);
      stroke(black);
      if (waveLevel == 2) {
      }
      strokeWeight(2);
      circle(x, y, d);
      if (mobLives <= 0) money += 10;
    }
    //println(vx,vy,mobMode);
    //println(dist(x,y,node2[2].x, node2[2].y));
    //println(dist(x, y, node1[1].x, node1[1].y));
  }

  void act() {

    int i = 0;
    while (i<bullets.size()) {
      Bullet bullet = bullets.get(i);
      if (dist(bullet.x, bullet.y, x, y) < d/2+bullet.d/2) {
        mobLives--;
      }
      //if (x > 800) {
      //  mobLives--;
      //}
      i++;
    }
    if(x>width-200+d/2) {
      lives--;
      mobLives = 0;
    }
    if (map == 1) {
      if (dist(x, y, node1[1].x, node1[1].y) <= 2) direction = up;
      if (dist(x, y, node1[2].x, node1[2].y) <= 2) direction = right;
      if (dist(x, y, node1[3].x, node1[3].y) <= 2) direction = down;
      if (dist(x, y, node1[4].x, node1[4].y) <= 2) direction = left;
      if (dist(x, y, node1[5].x, node1[5].y) <= 2) direction = up;
      if (dist(x, y, node1[6].x, node1[6].y) <= 2) direction = right;
    } else if (map == 2) {
      if (dist(x, y, node2[1].x, node2[1].y) <= 2) direction = up;
      if (dist(x, y, node2[2].x, node2[2].y) <= 2) direction = left;
      if (dist(x, y, node2[3].x, node2[3].y) <= 2) direction = down;
      if (dist(x, y, node2[4].x, node2[4].y) <= 2) direction = right;
      if (dist(x, y, node2[5].x, node2[5].y) <= 2) direction = up;
      if (dist(x, y, node2[6].x, node2[6].y) <= 2) direction = right;
    }


    x += vx;
    y += vy;
  }

  void healthbar() {
    //println(maxhp);
    //println(waveLevel);
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(purple);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), mobLives*50/maxhp, 20);
    rectMode(CENTER);
  }
}
