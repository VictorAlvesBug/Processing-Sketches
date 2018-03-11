void setup()
{
  size(800, 800, P3D);
  
  stroke(255,0,0);
  translate(width/2, height/2);
  
  
}

void draw()
{
  background(0);
  lights();
  
  DrawBox(width/2, width/2, width/2, width/20);
  
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateX(map(mouseY, 0, height, 0, TWO_PI));
}

void DrawBox(float posX, float posY, float posZ, float size)
{
  translate(posX, posY, posZ);
  box(size);
  translate(-posX, -posY, -posZ);
  
  if(size>20)
  {
    DrawBox(posX-size/2, posY-size/2, posZ-size/2, size/2);
    DrawBox(posX-size/2, posY-size/2, posZ+size/2, size/2);
    
    DrawBox(posX-size/2, posY+size/2, posZ-size/2, size/2);
    DrawBox(posX-size/2, posY+size/2, posZ+size/2, size/2);
    
    DrawBox(posX+size/2, posY-size/2, posZ-size/2, size/2);
    DrawBox(posX+size/2, posY-size/2, posZ+size/2, size/2);
    
    DrawBox(posX+size/2, posY+size/2, posZ-size/2, size/2);
    DrawBox(posX+size/2, posY+size/2, posZ+size/2, size/2);
  }
}