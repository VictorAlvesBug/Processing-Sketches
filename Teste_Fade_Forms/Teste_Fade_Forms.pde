float angulo = 0;

void setup()
{
  size(800, 800);
  background(0,0,255);
}

void draw()
{
  translate(width/2, height/2);
  
  fill(0, 0, 255, 30);
  rect(-width/2, -height/2, width, height);
  
  stroke(255);
  line(mouseX - width/2, mouseY - height/2, 100*cos(angulo), 100*sin(angulo));
  
  angulo += 0.01;
}