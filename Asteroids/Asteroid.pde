class Asteroid extends GameObject {
  int collisions;

  //big asteroids
  Asteroid() {
    LIVES = 1;
    collisions = 6;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI));
    SIZE = 110;
  }

  //broken asteroids
  Asteroid(int s, float x, float y, int h) {
    LIVES = 1;
    collisions = h;
    loc = new PVector (x, y);
    vel = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI));
    vel.setMag(6);
    SIZE = s;
  }

  void show() {
    stroke(255);
    ellipse(loc.x, loc.y, SIZE, SIZE);
        ellipse(loc.x, loc.y, SIZE/2, SIZE/2);
    ellipse(loc.x, loc.y, SIZE/4, SIZE/4);
    ellipse(loc.x, loc.y, SIZE/1.5, SIZE/1.5);
  }

  void act() {
    super.act();
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <= SIZE/2 + obj.SIZE/2) {
          obj.LIVES = 0;
          LIVES = 0;
          SCORE++;
          int num = 100;
          int n = 0;
          while (n < num) {
            myObjects.add(new Particles(int(random(0, 150)), loc.x, loc.y, 25));
            n++;
          }

          if (collisions >= 2) {
            myObjects.add(new Asteroid(SIZE/2, loc.x, loc.y, collisions/4));
            myObjects.add(new Asteroid(SIZE/2, loc.x, loc.y, collisions/4));
          }
        }
      }

      i++;
    }
  }
}
