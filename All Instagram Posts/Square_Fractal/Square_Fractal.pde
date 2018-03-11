int tipo = 0;

void setup()
{
    size(900, 900);
}

void draw()
{
    background(255);
    rectMode(CENTER);
    DrawSquare(width/2, width/2, width/3);
    tipo++;
    delay(5000);
}

void DrawSquare(float posX, float posY, float size)
{
    noStroke();

    fill(0);
    
    if(tipo == 0)
    {
      rect(posX, posY, size, size);
      
      if(size>2)
      { 
        int div = 3;
        DrawSquare(posX-size, posY-size, size/div);
        DrawSquare(posX, posY-size, size/div);
        DrawSquare(posX+size, posY-size, size/div);
        
        DrawSquare(posX-size, posY, size/div);
        DrawSquare(posX+size, posY, size/div);
        
        DrawSquare(posX-size, posY+size, size/div);
        DrawSquare(posX, posY+size, size/div);
        DrawSquare(posX+size, posY+size, size/div);
      }
    }
    else if(tipo == 1)
    {
      rect(posX, posY, size, size);
      
      if(size>2)
      { 
        int divPos = 2, divSize = 2;
        DrawSquare(posX-size/divPos, posY-size/divPos, size/divSize);
        DrawSquare(posX+size/divPos, posY-size/divPos, size/divSize);
        DrawSquare(posX-size/divPos, posY+size/divPos, size/divSize);
        DrawSquare(posX+size/divPos, posY+size/divPos, size/divSize);
      }
    }
    else if(tipo == 2)
    {
      rect(posX-size, posY, size, size);
      rect(posX+size, posY, size, size);
      rect(posX, posY-size, size, size);
      rect(posX, posY+size, size, size);
      
      if(size>2)
      { 
        int divPos = 1, divSize = 3;
        DrawSquare(posX-size/divPos, posY-size/divPos, size/divSize);
        DrawSquare(posX+size/divPos, posY-size/divPos, size/divSize);
        DrawSquare(posX, posY, size/divSize);
        DrawSquare(posX-size/divPos, posY+size/divPos, size/divSize);
        DrawSquare(posX+size/divPos, posY+size/divPos, size/divSize);
      }
    }
    else if(tipo == 3)
    {
      rect(posX-size, posY-size, size, size);
      rect(posX+size, posY-size, size, size);
      rect(posX-size, posY+size, size, size);
      rect(posX+size, posY+size, size, size);
      
      if(size>2)
      { 
        int divPos = 1, divSize = 3;
        DrawSquare(posX-size/divPos, posY, size/divSize);
        DrawSquare(posX+size/divPos, posY, size/divSize);
        DrawSquare(posX, posY, size/divSize);
        DrawSquare(posX, posY-size/divPos, size/divSize);
        DrawSquare(posX, posY+size/divPos, size/divSize);
      }
    }
    else if(tipo == 4)
    {
      stroke(128);
      fill(128);
      beginShape();
      vertex(posX-size/2, posY-(1/3)*size*sqrt(3)/2);
      vertex(posX+size/2, posY-(1/3)*size*sqrt(3)/2);
      vertex(posX, posY+(2/3)*size*sqrt(3)/2);
      endShape(CLOSE);
      
      if(size>2 && false)
      { 
        DrawSquare(posX-size/2, posY+1/3*size*sqrt(3)/2, size/2);
        DrawSquare(posX+size/2, posY+1/3*size*sqrt(3)/2, size/2);
        DrawSquare(posX, posY-2/3*size*sqrt(3)/2, size/2);
      }
    }
}