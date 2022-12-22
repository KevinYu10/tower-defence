int b = 0;
void build() {

  if (map == 1) {
    gameMap1();
  } else if (map == 2) {
    gameMap2();
  }

  toolBar();
  buildButtons();
  buildTexts();
}

void buildButtons() {
  buildGameButton.show();
  if (buildGameButton.clicked) mode = GAME;

  gunTowerBuilding.show();
  aoeTowerBuilding.show();
  sniperTowerBuilding.show();

  if (gunTowerBuilding.clicked) {
    if (money >= 20) {
      gunTowers.add(new GunTower(mouseX, mouseY));
      money -= 20;
    }
  }
  int i = 0;
  while (i<gunTowers.size()) {
    gunTowers.get(i).show();
    i++;
  }

  if (aoeTowerBuilding.clicked) {
    if (money >= 50) {
      aoeTowers.add(new AoeTower(mouseX, mouseY));
      money -= 50;
    }
  }
  i = 0;
  while (i<aoeTowers.size()) {
    aoeTowers.get(i).show();
    i++;
  }

  if (sniperTowerBuilding.clicked) {
    if (money >= 100) {
      sniperTowers.add(new SniperTower(mouseX, mouseY));
      money -= 100;
    }
  }
  i = 0;
  while (i<sniperTowers.size()) {
    sniperTowers.get(i).show();
    i++;
  }
  returnButton.show();
  if (returnButton.clicked) {
    mode = INTRO;
    reset();
  }
}


void buildTexts() {
  b++;
  if (b<=30) {
    fill(red);
  } else {
    fill(white);
  }
  if (b >= 60) b = 0;
  textSize(50);
  text("Building", 400, 30);
}
