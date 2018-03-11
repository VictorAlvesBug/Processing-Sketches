float indexInicial = 0, angulo = 0, mult, r=0;

void setup()
{
  size(800, 800, P3D);
  rectMode(CENTER);
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  lights();

  noFill();
  stroke(255);

  //rotateX(map(mouseY, 0, height, 0, TWO_PI));
  //rotateY(map(mouseX, 0, width, 0, TWO_PI));

  rotateX(-r*0.3);
  rotateY(r*1.2);
  
  r += 0.01;

  mult = map(sin(angulo), -1, 1, 0, 0.5);

  angulo += 0.03;

  //DrawSquare(map(sin(angulo), -1, 1, 600, 150), 0, indexInicial);
  DrawSquare(200, 0, indexInicial);
}

void DrawSquare(float size, int direcao, float index)
{
  
  switch ((int)index%3)
  {
    case 0:
    fill(255, 0, 0);
    break;
    
    case 1:
    fill(0, 255, 0);
    break;
    
    case 2:
    fill(0, 0, 255);
    break;
  }
  
  stroke(0);
  strokeWeight(2);
  
  box(size);

  if (size > 10)
  {
    float newSize;
    
    //newSize = size*map(mouseX, 0, width, 0, 0.64); // MANUAL RESIZE 
    newSize = size*mult; // AUTO RESIZE
    
    if (direcao != 1)
    {
      pushMatrix();
      translate(-(size/2+newSize/2), 0, 0);
      DrawSquare(newSize, 2, index+1);
      popMatrix();
    }
    
    if (direcao != 2)
    {
      pushMatrix();
      translate((size/2+newSize/2), 0, 0);
      DrawSquare(newSize, 1, index+1);
      popMatrix();
    }
    
    if (direcao != 3)
    {
      pushMatrix();
      translate(0, -(size/2+newSize/2), 0);
      DrawSquare(newSize, 4, index+1);
      popMatrix();
    }
    
    if (direcao != 4)
    {
      pushMatrix();
      translate(0, (size/2+newSize/2), 0);
      DrawSquare(newSize, 3, index+1);
      popMatrix();
    }
    
    if (direcao != 5)
    {
      pushMatrix();
      translate(0, 0, (size/2+newSize/2));
      DrawSquare(newSize, 6, index+1);
      popMatrix();
    }
    
    if (direcao != 6)
    {
      pushMatrix();
      translate(0, 0, -(size/2+newSize/2));
      DrawSquare(newSize, 5, index+1);
      popMatrix();
    }
  }
}