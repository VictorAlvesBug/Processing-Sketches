PVector anterior, cor;
Laco[] laco;
int cont, contador = 0;

void setup()
{
  size(800, 800);
  background(0);
  
  laco = new Laco[3];
  
  
}

void draw()
{
  
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  //background(0);
  
  laco[0] = new Laco(0, new PVector(128, 0, 0));
  laco[1] = new Laco(1, new PVector(0, 128, 0));
  laco[2] = new Laco(2, new PVector(0, 0, 128));
  
  translate(width/2, 80);
  cont=0;
  
  for(int i=0; i<3; i++)
  {
    laco[i].mudarPosicao(-contador/10);
  }
  
  while(cont<5000)
  {
    for(int i=0; i<3; i++)
    {
      laco[i].update();
      laco[i].draw();
    }
       
    cont++;
  }
  cont = 0;
  
  rotate(-PI/10);
  //rotate(contador*PI/100);
  
  for(int i=0; i<25; i++)
  {
    DrawStar(5, 50-i*2, map(i, 0, 10, 50, 255));
  }
  
  contador++;
  
  //delay(100);
}

PVector DrawLine(float weight, PVector anterior, PVector atual, PVector cor)
{
  stroke(cor.x, cor.y, cor.z);
  strokeWeight(abs(weight));
  line(anterior.x, anterior.y, atual.x, atual.y);
  return atual;
}

void DrawStar(int pontas, int size, float cor)
{
  noStroke();
  fill(cor, cor, 0);
  beginShape();
  for(float i=0; i<TWO_PI; i+=TWO_PI/pontas/2)
  {
    float vert = map((TWO_PI/pontas) - i%(TWO_PI/pontas), 0, TWO_PI/pontas, 0, size);
    vertex(vert*cos(i), vert*sin(i));
  }
  endShape(CLOSE);

}