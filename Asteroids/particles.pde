class Particles extends GameObject {

  int transparency;
  color colour;

  Particles(int s, float x, float y, color c) {

    LIVES = 1;
    SIZE = s;
    colour = c;
    transparency = int(random(180, 255));
    loc = new PVector (x, y);
    vel = new PVector (0, 1);
    vel.rotate(random(-PI, PI)); 
    vel.setMag(random(-2, 2));
  }

  void show() {
    rectMode(CENTER);
    stroke(colour, transparency);
    noFill();
    square(loc.x, loc.y, SIZE);
  }
  void act() {
    super.act();
    transparency -= 20;
    if (transparency <= 0) LIVES = 0;
  }
}
