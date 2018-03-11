

void setup()
{
  size(800, 800);
}

void draw()
{
  Background(0);

  Fill(255);
  Stroke(255, 0, 0);
  StrokeWeight(6);

  /*float erro = 0;
   
   for (float i=0; i<1000; i += 1)
   {
   for (float j=0; j<1000; j += 1)
   {
   float err = (pow(i, j)-Pow(i, j));
   println("Erro = " + err + " (" + i + ", " + j + ")");
   
   if (err > erro)
   {
   erro = err;
   }
   }
   }
   println();
   println("Maior Erro = " + erro);*/

  //println(Random(5));

  noLoop();

  //Ellipse(300, 300, 100, 50);
  //Arc(500, 500, 100, 50, 0, 3*PI/2, 2);
  //Triangle(200, 200, 500, 200, 400, 300);

  /*BeginShape();
   
   for (float i=0; i<TWO_PI; i += TWO_PI/6)
   {
   Vertex(400+200*cos(i), 400+200*sin(i));
   }
   
   EndShape(close);*/
}