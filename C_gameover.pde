
void gameover() {
  background(black);
  fill(red);
  textSize(70);
  text("Gameover", 500, 200);
  text("Click to Return", 500, 400);
  returnButton.show();
  if (returnButton.clicked) {
    mode = INTRO;
    reset();
  }
}
