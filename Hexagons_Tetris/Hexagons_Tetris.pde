float angulo = 0;
ArrayList<Hexagon> hexagon = new ArrayList<Hexagon>();
int index=0;
char aux;
char[][] grid = new char[20][6];

void setup()
{
  size(800, 800);

  for (int layer=0; layer<20; layer++)
  {
    for (int slice=0; slice<6; slice++)
    {
      grid[layer][slice] = '0';
    }
  }
  
  hexagon.add(new Hexagon(0));
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  rotate(angulo);

  DrawBackground();

  hexagon.get(index).update();
  
  for (Hexagon h : hexagon)
  {
    h.draw();
  }

  //raio -= 5;
  angulo += 0.005;
}

void DrawBackground()
{
  for (int i=0; i<6; i++)
  {
    pushMatrix();
    noStroke();
    fill(((i%2)+1)*100, 0, 0);
    rotate(map(i, 0, 6, 0, TWO_PI));
    beginShape();

    vertex(0, 0);
    vertex(width*cos(0), width*sin(0));
    vertex(width*cos(TWO_PI/6), width*sin(TWO_PI/6));

    endShape();
    popMatrix();
  }

  fill(0, 128, 0);

  beginShape();
  for (float i=0; i<TWO_PI; i += TWO_PI/6)
  {
    vertex(20*cos(i), 20*sin(i));
  }
  endShape();
}

void keyPressed()
{
  switch(keyCode)
  {
  case LEFT:

    aux = hexagon.get(index).status[5];
    for (int i=5; i>0; i--)
    {
      hexagon.get(index).status[i] = hexagon.get(index).status[i-1];
    }
    hexagon.get(index).status[0] = aux;

    break;

  case RIGHT:

    aux = hexagon.get(index).status[0];
    for (int i=0; i<5; i++)
    {
      hexagon.get(index).status[i] = hexagon.get(index).status[i+1];
    }
    hexagon.get(index).status[5] = aux;

    break;
  }
}