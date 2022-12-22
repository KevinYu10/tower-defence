void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void keyPressed() {
  if (key == 'g' || key == 'G') mode = GAMEOVER;
}
