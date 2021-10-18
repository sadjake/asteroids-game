class UFOBullets extends GameObject {
  UFOBullets(float x, float y) {
    SIZE = 8;
    LIVES = 1;
    loc = new PVector(x, y);
    vel = new PVector(myShip.loc.x-x, myShip.loc.y-y);
    vel.setMag(12);
  }
  
  void show() {
    stroke(255,0,0);
    fill(255,0,0);
    ellipse(loc.x, loc.y, SIZE, SIZE);
  }

  void act() {
    loc.add(vel);
    if (loc.x < -50 || loc.x > width+50 || loc.y < -50 || loc.y > height+50) {
      LIVES = 0;
    }
  }
}
