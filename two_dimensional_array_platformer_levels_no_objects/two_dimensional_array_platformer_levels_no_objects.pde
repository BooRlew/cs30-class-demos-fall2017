//Dan Schellenberg
//
//2D Arrays Example - No Objects Used
//  - loading platformer level data
//  - tiles are from http://open.commonly.cc

char[][] tiles;
PImage levelBackground;
PImage platform, coin, box, fly, p1, slime, empty;
int tilesHigh, tilesWide;
float tileWidth, tileHeight;
String bgImage, levelToLoad;

void setup() {
  size(600, 450);  // 4:3 ratio
  bgImage = "level_background.png";
  levelToLoad = "levels/0.txt";
  
  initializeValues();
}

void draw() {
  display();
}

void initializeValues() {
  loadImages();

  //load level data
  String lines[] = loadStrings(levelToLoad);

  tilesHigh = lines.length;
  tilesWide = lines[0].length();

  tileWidth = width/tilesWide;
  tileHeight = height/tilesHigh;

  //println(tilesHigh, tilesWide);

  tiles = new char[tilesWide][tilesHigh];

  //put values into 2d array of characters
  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      char tileType = lines[y].charAt(x);
      tiles[x][y] = tileType;
    }
  }
}

void display() {
  image(levelBackground, 0, 0, width, height);

  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      showTile(tiles[x][y], x, y);
    }
  }
}

void showTile(char location, int x, int y) {
  if (location == '#') {
    image(platform, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'C') {
    image(coin, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'B') {
    image(box, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'F') {
    image(fly, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'P') {
    image(p1, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else if (location == 'S') {
    image(slime, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  } else {
    image(empty, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
}

void loadImages() {
  //load background
  levelBackground = loadImage(bgImage);

  //load tile images
  platform = loadImage("platform.png");
  coin = loadImage("coin.png");
  box = loadImage("boxItem.png");
  fly = loadImage("flyFly1.png");
  p1 = loadImage("p1_front.png");
  slime = loadImage("slimeWalk1.png");
  empty = loadImage("empty.png");
}