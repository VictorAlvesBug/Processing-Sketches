Bloco[][][] bloco = new Bloco[100][100][100];
float size = 20;
PVector translation = new PVector(400, 400, 2500);
int vel = 3;
void setup()
{
  size(800, 800, P3D);

  for (int k=0; k<100; k++)
  {
    for (int j=0; j<100; j++)
    {
      for (int i=0; i<100; i++)
      {
        bloco[i][j][k] = new Bloco(i, 100-j, k);

        if (j == 0)
        {
          bloco[i][j][k].desenhar = true;
        } else
        {
          bloco[i][j][k].desenhar = false;
        }
      }
    }
  }
}

void draw()
{
  background(0);
  translate(translation.x, translation.y, translation.z);

  //translate(0, 0, map(mouseX, 0, width, -1000, 1000));

  rotateX(-PI/2);
  //rotateX(map(mouseY, 0, height, -TWO_PI, TWO_PI));
  //rotateY(map(mouseX, 0, width, -TWO_PI, TWO_PI));

  for (int k=0; k<100; k++)
  {
    for (int j=0; j<100; j++)
    {
      for (int i=0; i<100; i++)
      {
        if (bloco[i][j][k].desenhar)
        {
          bloco[i][j][k].draw();
        }
      }
    }
  }

  if (keyPressed) 
  {
    if(keyCode >= '0' && keyCode <= '9')
    {
      vel = int(keyCode);
    }
    
    if(keyCode == UP)
    {
      translation.y += vel;
    }
    
    if(keyCode == DOWN)
    {
      translation.y -= vel;
    }
    
    if(keyCode == LEFT)
    {
      translation.x += vel;
    }
    
    if(keyCode == RIGHT)
    {
      translation.x -= vel;
    }
  }
  
  //println("translate = ("+ (translation.x) + ", " + (translation.y) + ", " + (translation.z) + ")");
}

void mouseClicked()
{
  // translate = (360.0, 363.0, 1600.0)

  // 360,363 --> 0,0
  // 0,0 --> 15,15

  int x, y=1, z;

  x = (int)(-260+translation.x + map(mouseX, 0, width, 0, 8.1)-47);
  //y = (int)map(mouseX, 0, width, 0, 99);
  z = (int)(-263+translation.y + map(mouseY, 0, height, 0, 8.3)-50);

  bloco[x][1][z].desenhar = true;
  
  println("(x, y, z) = " + x + ", " + y + ", " + z);
}

/*void keyPressed()
{
  switch(keyCode)
  {
  case UP:
    translation.y += 1;
    break;
  case DOWN:
    translation.y -= 1;
    break;
  case LEFT:
    translation.x += 1;
    break;
  case RIGHT:
    translation.x -= 1;
    break;
  }
}*/