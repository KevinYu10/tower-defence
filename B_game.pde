
void game() {

  if (map == 1) {
    gameMap1();
  } else if (map == 2) {
    gameMap2();
  }
  mobDisplay();
  gameDisplay();
  toolBar();
  gameButtons();
  gameSetups();
}

void gameMap1() {
  image(map1bg, 400, 400, 800, 800);
  stroke(lightPurple);
  strokeWeight(50);
  line(node1[0].x, node1[0].y, node1[1].x, node1[1].y);
  line(node1[1].x, node1[1].y, node1[2].x, node1[2].y);
  line(node1[2].x, node1[2].y, node1[3].x, node1[3].y);
  line(node1[3].x, node1[3].y, node1[4].x, node1[4].y);
  line(node1[4].x, node1[4].y, node1[5].x, node1[5].y);
  line(node1[5].x, node1[5].y, node1[6].x, node1[6].y);
  line(node1[6].x, node1[6].y, node1[7].x, node1[7].y);

  textAlign(CENTER, CENTER);
  textSize(30);
  fill(white);
  text("Lives: "+lives, 740, 50);
  text("Fund: "+money, 740, 25);
}

void gameMap2 () {
  image(map2bg, 400, 400, 800, 800);
  stroke(white);
  strokeWeight(50);
  line(node2[0].x, node2[0].y, node2[1].x, node2[1].y);
  line(node2[1].x, node2[1].y, node2[2].x, node2[2].y);
  line(node2[2].x, node2[2].y, node2[3].x, node2[3].y);
  line(node2[3].x, node2[3].y, node2[4].x, node2[4].y);
  line(node2[4].x, node2[4].y, node2[5].x, node2[5].y);
  line(node2[5].x, node2[5].y, node2[6].x, node2[6].y);
  line(node2[6].x, node2[6].y, node2[7].x, node2[7].y);

  textAlign(CENTER, CENTER);
  textSize(30);
  fill(white);
  text("Lives: "+lives, 740, 50);
  text("Fund: "+money, 740, 25);
}

void gameButtons() {
  gameWaveButton.show();
  fill(255);
  text("Next Wave: "+waveNumber, 900, 180);
  gameBuildButton.show();
  if (gameBuildButton.clicked && mobs.size() <= 0) mode = BUILD;
  returnButton.show();
  if (returnButton.clicked) {
    mode = INTRO;
    reset();
  }
  resetButton.show();
  if (resetButton.clicked) {
    reset();
  }

  waveLevelButton.show();
  if (waveLevelButton.clicked) {
    if (waveLevel<3) waveLevel++;
  }

  waveResetButton.show();
  if (waveResetButton.clicked) {
    waveLevel = 1;
  }
}


void gameDisplay() {
  int i = 0;
  while (i<mobs.size()) {
    mobs.get(i).show();
    mobs.get(i).act();
    mobs.get(i).healthbar();
    if (mobs.get(i).mobLives <= 0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while (i<gunTowers.size()) {
    gunTowers.get(i).show();
    gunTowers.get(i).act();
    i++;
  }

  i = 0;
  while (i<bullets.size()) {
    bullets.get(i).show();
    bullets.get(i).act();
    if (bullets.get(i).lives <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while (i<aoeTowers.size()) {
    aoeTowers.get(i).show();
    aoeTowers.get(i).act();
    i++;
  }

  i = 0;
  while (i<sniperTowers.size()) {
    sniperTowers.get(i).show();
    sniperTowers.get(i).act();
    i++;
  }
  
}

void mobDisplay() {
  if (gameWaveButton.clicked) {
    if (mobs.size() <= 0) {
      int i = 0;
      while (i<waveNumber) {
        mobs.add(new Mob(0-i*(60), 300, 0, waveLevel));
        if (waveNumber % 3 == 0 && mobs.size() % waveNumber == 0) {
          mobs.add(new Mob(-40, 300, 1, waveLevel));
        }
        if (waveNumber % 5 == 0 && mobs.size() % waveNumber == 0) {
          mobs.add(new Mob(-40, 300, 2, waveLevel));
        }
        i++;
      }
      waveNumber++;
    }
  }
  //println(waveNumber);
  //if(mobs.size() > 0) println(mobs.size());
  //else println(0);
  if (mobs.size()>0) {
    int i = 0;
    while (i<mobs.size()) {
      if (mobs.get(i).x>width-200+mobs.get(i).d/2) {
        lives--;
        mobs.remove(i);
        i--;
      }
      i++;
    }
  }
}

void toolBar() {
  noStroke();
  rectMode(CORNER);
  fill(0);
  rect(800, 0, 200, height);
  rectMode(CENTER);
}

void gameSetups() {
  if (lives<=0) {
    mode = GAMEOVER;
  }
}


void reset() {
  money = 50;
  lives = 3;
  waveNumber = 1;
  waveLevel = 1;
  while (mobs.size()>0) {
    mobs.remove(0);
  }
  while (gunTowers.size()>0) {
    gunTowers.remove(0);
  }
  while (aoeTowers.size()>0) {
    aoeTowers.remove(0);
  }
  while (sniperTowers.size()>0) {
    sniperTowers.remove(0);
  }
  while (bullets.size()>0) {
    bullets.remove(0);
  }
}
