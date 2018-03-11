float indexInicial = 0, angulo = 0, mult;

void setup()
{
  size(800, 800);
  rectMode(CENTER);
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  noFill();
  stroke(255);

  mult = map(sin(angulo), -1, 1, 0, 0.64);

  if(angulo%PI < 0.0001)
  {
    /*if(indexInicial == 0)
    {
      indexInicial = 1;
    }
    else
    {
      indexInicial = 0;
    }*/
  }
  
  rotate(angulo/4);

  angulo += 0.03;

  DrawSquare(map(sin(angulo), -1, 1, 600, 150), 0, indexInicial);
}

void DrawSquare(float size, int direcao, float index)
{
  /// ALTERNA ENTRE RGB
  /*switch((int)(index)%3)
  {
    case 0:
    fill(255, 0, 0);
  stroke(255, 0, 0);
    break;
    
    case 1:
    fill(0, 255, 0);
  stroke(0, 255, 0);
    break;
    
    case 2:
    fill(0, 0, 255);
  stroke(0, 0, 255);
    break;
  }
  */
  
  /// ALTERNA ENTRE PRETO E BRANCO
  
  fill(index%2 * 255);
  stroke((index+1)%2 * 255);
  

  rect(0, 0, size, size);

  if (size > 10)
  {
    float newSize;
    
    //newSize = size*map(mouseX, 0, width, 0, 0.64); // MANUAL RESIZE 
    newSize = size*mult; // AUTO RESIZE
    
    if (direcao != 1)
    {
      pushMatrix();
      translate(-(size/2+newSize/2), 0);
      DrawSquare(newSize, 2, index+1);
      popMatrix();
    }
    
    if (direcao != 2)
    {
      pushMatrix();
      translate((size/2+newSize/2), 0);
      DrawSquare(newSize, 1, index+1);
      popMatrix();
    }
    
    if (direcao != 3)
    {
      pushMatrix();
      translate(0, -(size/2+newSize/2));
      DrawSquare(newSize, 4, index+1);
      popMatrix();
    }
    
    if (direcao != 4)
    {
      pushMatrix();
      translate(0, (size/2+newSize/2));
      DrawSquare(newSize, 3, index+1);
      popMatrix();
    }
  }
}