int m = 0;
void mapSelection() {

  background(green);
  textSize(70);
  m++;
  if (m>30) {
    fill(white);
  } else {
    fill(red);
  }
  if (m>=60) m = 0;
  text("Map Selecting", width/2, 100);

  map1Button.show();
  map2Button.show();
  if (map1Button.clicked) {
    map = 1;
    mode = GAME;
  } else if (map2Button.clicked) {
    map = 2;
    mode = GAME;
  }

  imageMode(CENTER);
  image(map1bg, 250, 450, 200, 200);
  image(map2bg, 750, 450, 200, 200);
}
