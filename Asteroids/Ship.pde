class Ship extends GameObject {

  //1. Instance Variables
  PVector dir;

  //2. Constructor(s)
  Ship() {
    LIVES = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    dir = new PVector(0, -0.1);
    shootTimer = 0;
    teleportTimer = 0;
    shipImmunity = 0;
    transparent = 0;
    threshold = 60; 
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(dir.heading());
    noFill();
    
    //immuirty
    stroke(255, transparent);
    ellipse(0, 0, 50, 50);
    if (shipImmunity >= threshold*3) {
      stroke(0,50,255);
    } else {
      stroke(0,255,50);
    }
    
    // ship design 
    triangle(-15, -20, -15, 20, 15, 0); 
    popMatrix();
  }
  
  // immunity is on
  void act() {
    super.act();
    if (vel.mag()>5) vel.setMag(5);
    shootTimer++; 
    teleportTimer++; 
    shipImmunity++; 
    if (shipImmunity >= threshold*3) { 
      stroke(255);
      textSize(20);
      text("IMMUNITY: ON", 400, 125);
    }
    
    if (vel.mag() > 5) {
      vel.setMag(5);
    }    
    
    if (upkey == false) vel.setMag(vel.mag()*0.99);
    if (downkey == false) vel.setMag(vel.mag()*0.99);
    if (upkey) {
      vel.add(dir);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (downkey) vel.sub(dir);
    if (leftkey) dir.rotate(radians(-5));
    if (rightkey) dir.rotate(radians(5));
    if (spacekey && shootTimer > threshold/3) {
      myObjects.add(new Bullet());
      shootTimer = 0;
    }
    if (upkey == false) vel.setMag(vel.mag()*0.95); 
    
    //collision
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Asteroid || obj instanceof UFO || obj instanceof UFOBullets) {
        if (shipImmunity >= threshold*3 && dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= 15 + obj.SIZE/2) {
          LIVES = LIVES - 1;
          shipImmunity = 0;
        }
        
        // random spawn teleport
        if (mkey && teleportTimer >= threshold*3) {
          loc.x = int(random(0, width));
          loc.y = int(random(0, height));
          teleportTimer = 0;
          while (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= 30 + obj.SIZE/2) {
            loc.x = int(random(0, width));
            loc.y = int(random(0, height));
          }
        }
      }
      i++;
    }
  }
}
