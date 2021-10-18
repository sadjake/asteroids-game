class Fire extends GameObject {

  int transparent;
  PVector colid;

  Fire() {
    LIVES = 1;
    SIZE = 10;
    transparent = int(random(0, 255));
    loc = myShip.loc.copy();
    colid = myShip.dir.copy();
    colid.rotate(PI);
    colid.setMag(25);
    loc.add(colid);
    vel = myShip.dir.copy();
    vel.rotate(PI+random(-0.7, 0.7));
    vel.setMag(14);
  }

  void show() {
    rectMode(CENTER);
    fill(255, 255, 0, transparent);
    square(loc.x, loc.y, SIZE);
  }
  void act() {
    super.act();
    transparent -= 20;
    if (transparent <= 0) LIVES = 0;
  }
}
