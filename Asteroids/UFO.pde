class UFO extends GameObject {
  int displayUFO, bulletTimer;

  UFO() {
    displayUFO = int(random(0, 4));
    LIVES = 1;
    vel = new PVector (0, 1);
    bulletTimer = 40;
    threshold = 40;
    SIZE = 50;

    //UFO 
    pushMatrix();
    if (displayUFO == 0) {
      // appears from the top
      loc = new PVector (random(0, width), -50);
      vel.rotate(random(PI/4, (-3*PI)/4));
    } else if (displayUFO == 1) {
      // appears from the rightside
      loc = new PVector (width+ 50, random(0, height)); 
      vel.rotate(random(PI/4, (7*PI)/8));
    } else if (displayUFO == 2) {
      // appears from buttom
      loc = new PVector (random(0, width), height+50); 
      vel.rotate(random((5*PI)/4, (7*PI)/8));
    } else {
      // appears from lsefside
      loc = new PVector (-50, random(0, height)); 
      vel.rotate(random((-7*PI)/8, -PI/4));
    }
    popMatrix();
    vel.setMag(2);
  }

  //ufo 
  void show() {
    fill(25, 25, 25);
    stroke(255, 0, 35);
    ellipse(loc.x, loc.y, SIZE, SIZE);
    fill(24, 2, 100);
    ellipse(loc.x, loc.y, SIZE/2, SIZE/2);
    fill(24, 155, 20);
    ellipse(loc.x, loc.y, SIZE/4, SIZE/4);
        fill(90, 155, 100);
    ellipse(loc.x, loc.y, SIZE/8, SIZE/8);
            fill(53, 13, 12);
    ellipse(loc.x, loc.y, SIZE/16, SIZE/16);
  }

  void act() {
    loc.add(vel); 
    bulletTimer++; 
    // reappear?????
    if (bulletTimer >= threshold*1.5) {
      myObjects.add(new UFOBullets(loc.x, loc.y));
      bulletTimer = 0;
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= SIZE/2 + obj.SIZE/2) { 
          UFOtimer = 0;
          ufo = false;
          obj.LIVES = 0;
          LIVES = 0;
          int num = 100;
          int n = 0;
          while (n < num) {
            myObjects.add(new Particles(int(random(0, 10)), loc.x, loc.y, 255));
            n++;
          }
        }
      }
      i++;
    }
    if (loc.x < -50 || loc.x > width+50 || loc.y < -50 || loc.y > height+50) {
      LIVES = 0;
      UFOtimer = 0;
      ufo = false;
    }
  }
}
