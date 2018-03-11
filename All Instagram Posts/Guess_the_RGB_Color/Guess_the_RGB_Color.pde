color[] cor;
int indice, score=0;
Button[][] btnColor;

void setup()
{
  size(700, 700);
  rectMode(CENTER);

  cor = new color[6];
  btnColor = new Button[3][2];

  ShuffleColors();
}

void draw()
{ 
  background(255);
  noStroke();
  fill(0);
  rect(width/2, height/2 - 300, width, 150);

  rect(width/2, height/2 + 300, width, 150);

  noStroke();
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("RGB: " + int(red(cor[indice])) + ", " + int(green(cor[indice])) + ", " + int(blue(cor[indice])), width/2, height/2 - 280);

  text("Score: " + score, width/2, height/2 + 300);

  for (int i=0; i<3; i++)
  {
    for (int j=0; j<2; j++)
    {
      btnColor[i][j].show();
    }
  }
}

void ShuffleColors()
{
  int level = 4;

  for (int i=0; i<6; i++)
  {
    boolean valido;

    do
    {
      valido = true;
      cor[i] = color(int(random(level+1))*256/level, int(random(level+1))*256/level, int(random(level+1))*256/level);

      for (int j=0; j<i; j++)
      {
        if(cor[i] == cor[j])
        {
          valido = false;
        }
      }
    } 
    while (!valido);
  }

  for (int i=0; i<3; i++)
  {
    for (int j=0; j<2; j++)
    {
      btnColor[i][j] = new Button(i, j, cor[j*3+i]);
    }
  }

  indice = (int)random(6);
  
  println("indice: " + (indice+1));///
}

void mouseClicked()
{
  for (int i=0; i<3; i++)
  {
    for (int j=0; j<2; j++)
    {
      if (dist(mouseX, mouseY, btnColor[i][j].pos.x, btnColor[i][j].pos.y) < 75)
      {
        btnColor[i][j].click();
      }
    }
  }
}