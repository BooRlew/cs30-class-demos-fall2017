//Game of Life Simulation
//CS30
//Oct 27, 2017

//globals
int[][] board;
int cols, rows;
float cellWidth, cellHeight;

void setup() {
  size(800, 800);

  cols = 40;
  rows = 40;

  initializeValues();
  randomizeBoard();
}

void draw() {
  displayBoard();
}

void keyPressed() {
  if (key == ' ') {
    update();
  }
  if (key == 'c') {
    clearBoard();
  }
  if (key == 'g') {
    clearBoard();
    makeGun();
  }
}

void mousePressed() {
  int xCord = int(mouseX/cellWidth);
  int yCord = int(mouseY/cellHeight);

  //toggle
  if (board[xCord][yCord] == 1) {
    board[xCord][yCord] = 0;
  } else {
    board[xCord][yCord] = 1;
  }
}

void makeGun() {
  //left square
  board[1][6] = 1;
  board[2][6] = 1;
  board[1][7] = 1;
  board[2][7] = 1;
  
  //left side of gun
  board[11][6] = 1;
  board[11][7] = 1;
  board[11][8] = 1;
  board[12][5] = 1;
  board[12][9] = 1;
  board[13][4] = 1;
  board[13][10] = 1;
  board[14][4] = 1;
  board[14][10] = 1;
  
  board[15][7] = 1;
  board[16][5] = 1;
  board[16][9] = 1;
  board[17][6] = 1;
  board[17][7] = 1;
  board[17][8] = 1;
  board[18][7] = 1;
  
  //right side of gun
  board[21][6] = 1;
  board[21][5] = 1;
  board[21][4] = 1;
  board[22][6] = 1;
  board[22][5] = 1;
  board[22][4] = 1;
  board[23][3] = 1;
  board[23][7] = 1;
  
  board[25][3] = 1;
  board[25][7] = 1;
  board[25][2] = 1;
  board[25][8] = 1;
  
  //right square
  board[35][4] = 1;
  board[35][5] = 1;
  board[36][4] = 1;
  board[36][5] = 1;
}

void clearBoard() {
  //a new array has default values of 0
  board = new int[cols][rows];
}

void update() {
  int[][] nextTurn = new int[cols][rows];

  //ignore the edges, just cause it's faster to make...
  //you can fix this yourself, if you want.
  for (int x=1; x<cols-1; x++) {
    for (int y=1; y<rows-1; y++) {

      int neighbors = 0;

      for (int i=-1; i<=1; i++) {
        for (int j=-1; j<=1; j++) {
          neighbors += board[x+i][y+j];
        }
      }

      //don't add the cell itself to the neighbors
      neighbors -= board[x][y];

      //apply the rules of the game
      if (board[x][y] == 1) {  //alive right now
        if (neighbors == 2 || neighbors == 3) {
          nextTurn[x][y] = 1;
        } else {
          nextTurn[x][y] = 0;
        }
      }

      if (board[x][y] == 0) { //dead right now
        if (neighbors == 3) {
          nextTurn[x][y] = 1;
        } else {
          nextTurn[x][y] = 0;
        }
      }
    }
  }

  board = nextTurn;
}

void displayBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      if (board[x][y] == 1) {
        fill(0);  //alive
      } else {
        fill(255); //dead
      }
      rect(x*cellWidth, y*cellHeight, cellWidth, cellHeight);
    }
  }
}

void initializeValues() {
  board = new int[cols][rows];
  cellWidth = width/cols;
  cellHeight = height/rows;
}

void randomizeBoard() {
  for (int x=0; x<cols; x++) {
    for (int y=0; y<rows; y++) {
      board[x][y] = int(random(2));
    }
  }
}