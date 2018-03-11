Block[][] grid;
int currentPlayer = 1, count = 0;
boolean gameover = false;
int placarPlayer1=0, placarPlayer2=0;
PVector beginWinnerLine = new PVector(0, 0);
PVector endWinnerLine = new PVector(0, 0);


void setup()
{
  size(750, 750);

  grid = new Block[7][7];

  for (int row=0; row<7; row++)
  {
    // ROW 6 IS TO INSERT STONES
    for (int col=0; col<7; col++)
    {
      grid[col][row] = new Block(col, row);
    }
  }
}

void draw()
{
  background(0, 0, 255);

  for (int row=0; row<7; row++)
  {
    // ROW 6 IS TO INSERT STONES
    for (int col=0; col<7; col++)
    {
      grid[col][row].show();
    }
  }

  if (gameover)
  {
    GameOver(1 + currentPlayer%2);
    noLoop();///
    
    /*for (int row=0; row<7; row++)
    {
      for (int col=0; col<7; col++)
      {
        grid[col][row] = new Block(col, row);
      }
    }

    //currentPlayer = 1;
    count = 0;
    gameover = false;*/
  } else
  {
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Green Player " + placarPlayer1 + " x " + placarPlayer2 + " Red Player", width/2, 25);
  }

  ///////////////////////



  /*frameRate(2);

  while (addStone(floor(random(0, 6))) == false)
  {
  }

  if (currentPlayer == 1)
  {
    currentPlayer = 2;
  } else
  {
    currentPlayer = 1;
  }

  for (int reference=1; reference<3; reference++)
  {
    // CHECKING ROWS
    for (int row=0; row<6; row++) { 
      for (int col=0; col<7; col++) { 
        if (checkGameOver(col, row, reference)) { 
          gameover = true; 
          return;
        }
      }
      count=0;
    }

    // CHECKING COLUMNS
    for (int col=0; col<7; col++) { 
      for (int row=0; row<6; row++) {
        if (checkGameOver(col, row, reference)) { 
          gameover = true; 
          return;
        }
      }
      count=0;
    }

    // CHECKING DECRESCENT DIAGONALS (i-j < 7 && i-j < 0)
    for (int i=0; i<12; i++) { 
      for (int j=0; (j<i+1 && j>=0 && j<7 && i-j>=0 && i-j<7); j++) {
        if (checkGameOver(j, i-j, reference)) { 
          gameover = true; 
          return;
        }
      }
      count=0;
    }

    // CHECKING CRESCENT DIAGONALS
    for (int i=0; i<12; i++) { 
      for (int j=0; (j<i+1 && j>=0 && j<7 && i-j>=0 && i-j<7); j++) {
        if (checkGameOver(6-j, i-j, reference)) { 
          gameover = true; 
          return;
        }
      }
      count=0;
    }
  }*/
}

void mouseClicked()
{
  if (!gameover)
  {
    if (addStone(floor(map(mouseX, 25, width-25, 0, 7))))
    {
      if (currentPlayer == 1)
      {
        currentPlayer = 2;
      } else
      {
        currentPlayer = 1;
      }

      for (int reference=1; reference<3; reference++)
      {
        // CHECKING ROWS
        for (int row=0; row<6; row++) { 
          for (int col=0; col<7; col++) { 
            if (checkGameOver(col, row, reference)) { 
              gameover = true; 
              return;
            }
          }
          count=0;
        }

        // CHECKING COLUMNS
        for (int col=0; col<7; col++) { 
          for (int row=0; row<6; row++) {
            if (checkGameOver(col, row, reference)) { 
              gameover = true; 
              return;
            }
          }
          count=0;
        }

        // CHECKING DECRESCENT DIAGONALS (i-j < 7 && i-j < 0)
        for (int i=0; i<12; i++) { 
          for (int j=0; (j<i+1 && j>=0 && j<7 && i-j>=0 && i-j<7); j++) {
            if (checkGameOver(j, i-j, reference)) { 
              gameover = true; 
              return;
            }
          }
          count=0;
        }

        // CHECKING CRESCENT DIAGONALS
        for (int i=0; i<12; i++) { 
          for (int j=0; (j<i+1 && j>=0 && j<7 && i-j>=0 && i-j<7); j++) {
            if (checkGameOver(6-j, i-j, reference)) { 
              gameover = true; 
              return;
            }
          }
          count=0;
        }
      }
    }
  } else
  {
    // GAME OVER IS TRUE

    for (int row=0; row<7; row++)
    {
      for (int col=0; col<7; col++)
      {
        grid[col][row] = new Block(col, row);
      }
    }

    //currentPlayer = 1;
    count = 0;
    gameover = false;
    loop();
  }
}

boolean checkGameOver(int col, int row, int reference)
{
  if (grid[col][row].stone == reference)
  {
    count++;

    if (count == 1)
    {
      beginWinnerLine = new PVector(grid[col][row].pos.x+50, grid[col][row].pos.y+50);
    } else if (count >= 4)
    {
      endWinnerLine = new PVector(grid[col][row].pos.x+50, grid[col][row].pos.y+50);
      return true;
    }
  } else
  {
    count = 0;
  }

  return false;
}

void GameOver(int winner)
{
  strokeWeight(10);
  stroke(32);
  line(beginWinnerLine.x, beginWinnerLine.y, endWinnerLine.x, endWinnerLine.y);

  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("GAME OVER\n" + ((winner==1) ? "Green":"Red") + " Player is the WINNER!!!", width/2, 40);

  if (winner==1)
  {
    placarPlayer1++;
  } else
  {
    placarPlayer2++;
  }
}