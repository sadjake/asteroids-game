void game() {

  background(0);
  strokeWeight(1);
  fill(55, 255, 14);
  textSize(40);
  text("SCORE: " + SCORE, 125, 750);
  text("LIVES: " + myShip.LIVES, 675, 750);
  fill(255, 5, 214);
  text("click anywhere to pause", 420, 50);
  text("press m to teleport", 420, 90);
  UFOtimer++;

  int i = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();
    if (ufo == false && UFOtimer>= 1000) {
      myObjects.add(new UFO());
      ufo = true;
    }
    if (obj.LIVES == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
    if (SCORE == 9) {
      mode = GAMEOVER;
    }
    if (myShip.LIVES == 0) {
      mode = GAMEOVER;
    }
  }
}

void gameClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = PAUSE;
  }
}
