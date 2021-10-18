void intro() {
  background(0);
  fill(255);
  textSize(50);
  textAlign(CENTER,CENTER);
  text("low budget asteroid game", 400, 400);
  text("click on the screen to start", 400, 545); 
}
void introClicks() {
  if (mouseX>0 && mouseY<800 && mouseX<800 && mouseY>0) { 
    mode = GAME;
  } 
}
