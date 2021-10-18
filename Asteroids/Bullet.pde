class Bullet extends GameObject {
  PVector hits;
  Bullet() {
    LIVES = 1;
    loc = new PVector(myShip.loc.x, myShip.loc.y); 
    hits = myShip.dir.copy();
    hits.rotate(PI);
    hits.setMag(-20);
    loc.add(hits);
    vel = new PVector(myShip.dir.x, myShip.dir.y); 
    vel.setMag(12);
    vel.add(myShip.vel);
    SIZE = 8;
  }

  void show() {
    stroke(255);
    fill(255);
    ellipse(loc.x, loc.y, SIZE, SIZE);
  }

  void act() { 
    loc.add(vel);
    if (loc.x < -50 || loc.x > width+50 || loc.y < -50 || loc.y > height+50) {
      LIVES = 0;
    }
  }
}
