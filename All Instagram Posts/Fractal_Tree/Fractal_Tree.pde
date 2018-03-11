float angle = 0, maxIndex = 0;
int direcao = 1;

void setup()
{
  size(800, 800);
  colorMode(HSB);
}

void draw()
{
  background(0);
  translate(width/2, height);
  
  //angle = map(mouseX, 0, width, 0, TWO_PI);
  angle += direcao*0.005;
  
  if(angle<0 || angle>PI/2)
  {
    direcao *= -1;
  }
    
  strokeWeight(3);
  stroke(map(angle, 0, PI/2, 0, 360), 255, 255);
  DrawBranch(200, 0);
}

void DrawBranch(float size, int index)
{
  colorMode(HSB);
  //stroke(map(index, 0, maxIndex, 0, 2*255)%360, 255, 255);
  line(0, 0, 0, -size);
  
  translate(0, -size);
  
  if(size>4)
  {
    rotate(angle);
    DrawBranch(size*0.66, index+1);
    rotate(-2*angle);
    DrawBranch(size*0.66, index+1);
    rotate(angle);
  }
  else
  {
    maxIndex = index;
  }
  
  translate(0, size);
}