//Carl Lawrence Ramos and Dan Schellenberg
//  - Schellenberg adapted this to add arrays!
//I tried to make a very basic game like galaga, after you run the program it shoud show an invader and a ship and if you left click the button and it hits the invader it should teleport around
//
//Controls:
//"WASD" to move
//click the left mouse button to shoot
//
//Extra for experts:
//random
//collision detection
//
//Future changes that I will made and problems that i can't fix right now:
//planned to make shoot multiple bullets, right now it only shoot one and if you spam it it resets it coordinates
//add more enemies
//make the enemy shoot
//have and show lives and bullets
//better background
//animation & sounds
//etc
//
//Images Citation
//https://donaldcarling.wordpress.com/2016/03/ - laser
//http://galaxian.wikia.com/wiki/Galaga_Arrangement - ship
//https://strategywiki.org/wiki/Galaga/Getting_Started - invader


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//globals

float shipSpeed;
float invaderSpeed;

float invaderX, invaderY, invaderWidth, invaderHeight;
float missileX, missileY, missileWidth, missileHeight, missileSpeed;

float shipX, shipY, shipWidth, shipHeight;

float currentMissileYPosition, currentMissileXPosition;

boolean movingUp, movingDown, movingLeft, movingRight;
boolean missileFire; 

PImage theShip;
float shipScale;

PImage invader;
float invaderScale;

PImage missile;
float missileScale;

//this is pretty hacky - much better ways exist when we know classes...
FloatList theMissilesX = new FloatList();  //sort of ignore this for now...
FloatList theMissilesY = new FloatList();  //sort of ignore this for now...

//Setup
void setup() {
  size(800, 800);

  // Setup for the Ship
  shipX = width/2;
  shipY = height/2;
  shipSpeed = 5;
  shipWidth = 30;
  shipHeight = 30;

  //Setup for invader's hitbox
  invaderX = random(0, width);
  invaderY = random (0, height/2);
  invaderWidth = 70;
  invaderHeight = 70;

  //Setup for missile's hotbox
  missileX = shipX;
  missileY = shipY;
  missileWidth = 10;
  missileHeight = 40;
  missileSpeed = 20;

  //Seetup for the images 
  theShip = loadImage("Galaga_Fighter.png");
  shipScale = .5;
  invader = loadImage("Invader.png");
  invaderScale = .6; 
  missile = loadImage("laser.png");
  missileScale = .1;

  //Setup for the movements
  movingUp = false;
  movingDown = false;
  movingLeft = false;
  movingRight = false;
  missileFire = false;
}


void draw() {
  backgroundDetails();

  //calling all the functions
  moveCharacter();
  displayCharacter();
  spawnMissile();
  spawnEnemies();
}


//background detail
void backgroundDetails() {
  background(0);
  fill(255);
  ellipse(random(0, width), random(0, height), 5, 5);
  ellipse(random(0, width), random(0, height), 5, 5);
}


// drawing the hit box and the image for the character(ship)
void displayCharacter() {
  fill(255);
  shapeMode (CENTER);
  rect(shipX, shipY, shipWidth, shipHeight);

  imageMode (CENTER);
  image(theShip, shipX+10, shipY, theShip.width*shipScale, theShip.height*shipScale);
}


//function for the enemy
void spawnEnemies() {
  //checking for the collision bewtween the hitbox of the invader and the laser
  if (currentMissileXPosition + missileWidth >= invaderX &&  
    currentMissileXPosition <= invaderX + invaderWidth &&  
    currentMissileYPosition + missileHeight >= invaderY &&    
    currentMissileYPosition <= invaderY + invaderHeight) {   
    invaderX = random(0, width);
    invaderY = random (0, height/2);
  }
  //drawing the hitbox and the image of the invader(enemy)     
  else {
    shapeMode (CENTER);
    noStroke();
    fill(0);
    rect(invaderX, invaderY, invaderWidth, invaderHeight);
    imageMode (CENTER);
    image(invader, invaderX+30, invaderY+30, invader.width*invaderScale, invader.height*invaderScale);
  }
}


//setup for firing the missile
void mousePressed() {
  if (mouseButton == LEFT) {
    theMissilesY.append(shipY);
    theMissilesX.append(shipX);
    //made for tracking the current coordinates of the ship (made so the missile wont follow the ship if it moves)
    currentMissileYPosition = shipY;
    currentMissileXPosition = shipX;
  }
}


//function for spawning the missile and drawing the hitbox of the miisle and the image
void spawnMissile() {
  if (theMissilesY.size() > 0) {
    for (int counter=0; counter<theMissilesY.size(); counter++) {
      fill(0);
      rect(theMissilesX.get(counter), theMissilesY.get(counter), missileWidth, missileHeight);
      image(missile, theMissilesX.get(counter), theMissilesY.get(counter), missile.width * missileScale, missile.height*missileScale);
      //making the missile's shoot upwards 
      if (missileY > 0) {
        theMissilesY.sub(counter, missileSpeed);
      }
    }
  }
}

//movements settings & settings for how the missile follow the ship so it shoots where the ship is
void moveCharacter() {
  if (movingUp) {
    shipY -= shipSpeed;
    missileY -= shipSpeed;
  }
  if (movingDown) {
    shipY += shipSpeed;
    missileY += shipSpeed;
  }
  if (movingLeft) {
    shipX -= shipSpeed;
    missileX -= shipSpeed;
  }
  if (movingRight) {
    shipX += shipSpeed;
    missileX += shipSpeed;
  }
}

//movements settings
void keyPressed() {
  if (key == 'w' || key == 'W') {
    movingUp = true;
  }
  if (key == 's' || key == 'S') {
    movingDown = true;
  }
  if (key == 'd' || key == 'D') {
    movingRight = true;
  }
  if (key == 'a' || key == 'A') {
    movingLeft = true;
  }
}

//removing the delay for the movements using keyboard
void keyReleased() {
  if (key == 'w' || key == 'W') {
    movingUp = false;
  }
  if (key == 's' || key == 'S') {
    movingDown = false;
  }
  if (key == 'd' || key == 'D') {
    movingRight = false;
  }
  if (key == 'a' || key == 'A') {
    movingLeft = false;
  }
}