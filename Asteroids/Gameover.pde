void gameover() {

  if (SCORE == 9) { //VICTORY!!!!!!
    background(255);
    fill(0,255,0);
    textSize(50);
    text("VICTORY", 400, 400);
    
    text("Click anywhere to play again", 400, 500);
    textSize(50);
  } else { // When you lose
    background(0);
    fill(255,0,0);
    textSize(50);
    text("DEFEAT", 400, 400);
       text("Click anywhere to play again", 400, 500);
    textSize(50);
  }
}

void gameoverClicks() {
  setup();
  mode = INTRO;
      SCORE = 0;
    ufo = false;
}
