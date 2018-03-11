int maxX, maxY, maxZ;

Bloco[][][] bloco;
String direcao = "forward"; // (forward, up, down, left, right)
PVector cabeca, food, rodar;
int limite = 3;
boolean mudouDirecao = false;

void setup()
{
  size(800, 800, P3D);
  //fullScreen();

  //noCursor();

  maxX = 20;
  maxY = 20;
  maxZ = 20;

  bloco = new Bloco[maxX][maxY][maxZ];
  cabeca = new PVector((int)maxX/2, (int)maxY/2, (int)maxZ/2);

  for (int z=0; z<maxY; z++)
  {
    for (int y=0; y<maxY; y++)
    {
      for (int x=0; x<maxX; x++)
      {
        bloco[x][y][z] = new Bloco(x, y, z);
      }
    }
  }

  GerarFood();
}

void draw()
{
  background(0);

  //lights();
  
  //pushMatrix();
  translate(400, 400, 400);
  //popMatrix();
  
  //rotateX(6*PI/6);
  //rotateY(PI/4);
  //rotateX(map(mouseY, 0, height, 0, TWO_PI));
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  
  //translate(-400, -400, 800);
  camera();
  rotateY(map(mouseX, 0, width, TWO_PI, 0));
  
  switch(direcao) /// DEPENDE DO ROTATE
  {
  case "left":
    cabeca.x--;
    break;
  case "right":
    cabeca.x++;
    break;
  case "up":
    cabeca.y--;
    break;
  case "down":
    cabeca.y++;
    break;
  case "backward":
    cabeca.z--;
    break;
  case "forward":
    cabeca.z++;
    break;
  }

  if (cabeca.x < 0)
  {
    cabeca.x = maxX - 1;
  }

  if (cabeca.x >= maxX)
  {
    cabeca.x = 0;
  }

  if (cabeca.y < 0)
  {
    cabeca.y = maxY - 1;
  }

  if (cabeca.y >= maxY)
  {
    cabeca.y = 0;
  }

  if (cabeca.z < 0)
  {
    cabeca.z = maxZ - 1;
  }

  if (cabeca.z >= maxZ)
  {
    cabeca.z = 0;
  }

  if (bloco[(int)cabeca.x][(int)cabeca.y][(int)cabeca.z].status == "Food")
  {
    limite++;
    GerarFood();
  } else if (bloco[(int)cabeca.x][(int)cabeca.y][(int)cabeca.z].status == "Snake")
  {
    // GAME OVER
    limite = 3;
  }

  bloco[(int)cabeca.x][(int)cabeca.y][(int)cabeca.z].status = "Snake";

  for (int z=0; z<maxY; z++)
  {
    for (int y=0; y<maxY; y++)
    {
      for (int x=0; x<maxX; x++)
      {
        bloco[x][y][z].update();
        bloco[x][y][z].draw();
      }
    }
  }

  delay(100);

  mudouDirecao = false;

  //Artificial Intellingence

  /*if (!mudouDirecao)
   {
   if (cabeca.x == food.x)
   {
   if (food.y < cabeca.y && direcao != "down")
   {
   direcao = "up";
   mudouDirecao = true;
   } else if (food.y > cabeca.y && direcao != "up")
   {
   direcao = "down";
   mudouDirecao = true;
   } else
   {
   direcao = "right";
   mudouDirecao = true;
   }
   } else
   {
   direcao = "right";
   mudouDirecao = true;
   }
   }*/

  
}

void keyPressed() 
{
  if (key == CODED && !mudouDirecao) 
  {

    if (false && (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT))
    {
      switch(direcao)
      {
      case "forward":
        rotateX(0);
        rotateY(0);
        rotateZ(0);
        break;

      case "backward":
        rotateX(0);
        rotateY(PI);
        rotateZ(0);
        break;

      case "up":
        rotateX(-PI/2); // POSSIVEL ERRO
        rotateY(0);
        rotateZ(0);
        break;

      case "down":
        rotateX(PI/2); // POSSIVEL ERRO
        rotateY(0);
        rotateZ(0);
        break;

      case "left":
        rotateX(0);
        rotateY(0);
        rotateZ(-PI/2); // POSSIVEL ERRO
        break;

      case "right":
        rotateX(0);
        rotateY(0);
        rotateZ(PI/2); // POSSIVEL ERRO
        break;
      }
    }

    switch(direcao)
    {
    case "forward":
      switch(keyCode)
      {
      case UP:
        direcao = "up";
        mudouDirecao = true;
        break;
      case DOWN:
        direcao = "down";
        mudouDirecao = true;
        break;
      case LEFT:
        direcao = "left";
        mudouDirecao = true;
        break;
      case RIGHT:
        direcao = "right";
        mudouDirecao = true;
        break;
      }
      break;
    case "backward":
      switch(keyCode)
      {
      case UP:
        direcao = "up";
        mudouDirecao = true;
        break;
      case DOWN:
        direcao = "down";
        mudouDirecao = true;
        break;
      case LEFT:
        direcao = "right";
        mudouDirecao = true;
        break;
      case RIGHT:
        direcao = "left";
        mudouDirecao = true;
        break;
      }
      break;
    case "up":
      switch(keyCode)
      {
      case UP:
        direcao = "backward";
        mudouDirecao = true;
        break;
      case DOWN:
        direcao = "forward";
        mudouDirecao = true;
        break;
      case LEFT:
        direcao = "left";
        mudouDirecao = true;
        break;
      case RIGHT:
        direcao = "right";
        mudouDirecao = true;
        break;
      }
      break;
    case "down":
      switch(keyCode)
      {
      case UP:
        direcao = "forward";
        mudouDirecao = true;
        break;
      case DOWN:
        direcao = "backward";
        mudouDirecao = true;
        break;
      case LEFT:
        direcao = "left";
        mudouDirecao = true;
        break;
      case RIGHT:
        direcao = "right";
        mudouDirecao = true;
        break;
      }
      break;
    case "left":
      switch(keyCode)
      {
      case UP:
        direcao = "up";
        mudouDirecao = true;
        break;
      case DOWN:
        direcao = "down";
        mudouDirecao = true;
        break;
      case LEFT:
        direcao = "backward";
        mudouDirecao = true;
        break;
      case RIGHT:
        direcao = "forward";
        mudouDirecao = true;
        break;
      }
      break;
    case "right":
      switch(keyCode)
      {
      case UP:
        direcao = "up";
        mudouDirecao = true;
        break;
      case DOWN:
        direcao = "down";
        mudouDirecao = true;
        break;
      case LEFT:
        direcao = "forward";
        mudouDirecao = true;
        break;
      case RIGHT:
        direcao = "backward";
        mudouDirecao = true;
        break;
      }
      break;
    }

    if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT)
    {
      switch(direcao)
      {
      case "forward":
        rotateX(0);
        rotateY(0);
        rotateZ(0);
        break;

      case "backward":
        rotateX(0);
        rotateY(PI);
        rotateZ(0);
        break;

      case "up":
        rotateX(PI/2); // POSSIVEL ERRO
        rotateY(0);
        rotateZ(0);
        break;

      case "down":
        rotateX(-PI/2); // POSSIVEL ERRO
        rotateY(0);
        rotateZ(0);
        break;

      case "left":
        rotateX(0);
        rotateY(0);
        rotateZ(PI/2); // POSSIVEL ERRO
        break;

      case "right":
        rotateX(0);
        rotateY(0);
        rotateZ(-PI/2); // POSSIVEL ERRO
        break;
      }
    }
  }
}

void GerarFood()
{
  int rndX, rndY, rndZ;

  do
  {
    rndX = (int)random(maxX);
    rndY = (int)random(maxY);
    rndZ = (int)random(maxZ);
  }
  while (bloco[rndX][rndY][rndZ].status == "Snake");

  bloco[rndX][rndY][rndZ].status = "Food";
  food = new PVector(rndX, rndY, rndZ);
}