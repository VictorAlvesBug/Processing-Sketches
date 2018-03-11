Turtle turtle;
boolean play = false;
int i=0;

void setup()
{
  //size(800, 800);
  size(900, 300);
  turtle = new Turtle(10, height/2, 0);
  //background(0);
  background(255);

  turtle.setPosition(75, height/2);
  turtle.write("ECOTECH", 100, "Normal", 30);
  //turtle.write("FIAP", 100, "FIAP", 30);
}

void draw()
{
  if (play)
  {
    if (i<turtle.point.size()-1)
    {
      do
      {
        i++;
      } 
      while (i+1>=turtle.point.size() ? false : !turtle.visible.get(i+1));

      if (i<turtle.point.size()-1)
      {
        PVector p1 = turtle.point.get(i);
        PVector p2 = turtle.point.get(i+1);
        
        /*PVector cor = new PVector(
        map(i, 0, turtle.point.size()-1, 22, 6),
        map(i, 0, turtle.point.size()-1, 216, 251),
        map(i, 0, turtle.point.size()-1, 145, 202));*/
        /*PVector cor = new PVector(
        map(i, 0, turtle.point.size()-1, 26, 6),
        map(i, 0, turtle.point.size()-1, 221, 251),
        map(i, 0, turtle.point.size()-1, 148, 202));*/
        PVector cor = new PVector(
        map(i, 0, turtle.point.size()-1, 38, 6),
        map(i, 0, turtle.point.size()-1, 181, 251),
        map(i, 0, turtle.point.size()-1, 88, 202));
        
        stroke(cor.x, cor.y, cor.z);
        //stroke(22, 216, 145);
        strokeWeight(8);
        line(p1.x, p1.y, p2.x, p2.y);
      }
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    play = true;
  }
}