//Jake Choi
//October 4, 2021

boolean upkey, downkey, leftkey, rightkey, spacekey, mkey;
boolean ufo;
Ship myShip;
ArrayList <GameObject> myObjects;
int SCORE;
int UFOtimer;
int shootTimer, teleportTimer, shipImmunity, threshold, transparent, c;

// MODE FRamwork
int mode;
final int INTRO = 0;
final int GAME  = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;


void setup() {
  size(800, 800);
  rectMode(CENTER);

  myShip = new Ship();
  UFOtimer = 0;
  ufo = false;
  SCORE = 0;
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  
  // 3 main asteroids
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println();
  }
}
