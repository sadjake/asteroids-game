void pause() {
  fill(255);
  textSize(40);
  text("paused, click anywhere to resume",width/2,height/2-50);
}

void pauseClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    mode = GAME;
  }
}
