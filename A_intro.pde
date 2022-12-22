
void intro() {

  introGif.show();
  introButton.show();
  if (introButton.clicked) mode = MAPSELECTION;
  fill(darkBlue);
  textSize(70);
  text("Tower Defence", width/2, height/4);
}
