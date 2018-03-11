float nMax = 20, angulo = 0, escala = 1, regiao = 4;



void setup()
{
  size(800, 800);
  //size(400, 400);
  //fullScreen();
  colorMode(HSB);
  //noCursor();
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  //translate(-width/2+mouseX, -height/2+mouseY);
  //scale(escala);
  //translate(width/2-mouseX, height/2-mouseY);

  escala += 0.1;
  regiao *= 0.9;

  float desvioX, desvioY;
  
  /// MANUAL CHANGE
  //desvioX = map(mouseX, 0, width, -1, 1);
  //desvioY = map(mouseY, 0, height, -1, 1);
  
  float raio = 0.7885;
  
  /// AUTO CHANGE
  //desvioX = raio*cos(angulo);
  //desvioY = raio*sin(angulo);/
  
  /// TESTE
  desvioX = -0.835;
  desvioY = -0.2321;
  
  angulo += 0.1;
  
  float passo = 1;

  for (int j=-height/2; j<height/2; j += passo)
  {
    for (int i=-width/2; i<width/2; i += passo)
    {
      // mouseX/width
      // /regiao
      
      /// ZOOM IN
      //float a = map(i, -width/2, width/2, -regiao*mouseX/width, regiao*mouseX/width + regiao);
      //float b = map(j, -height/2, height/2, -regiao*mouseY/height, regiao*mouseY/height + regiao);
      
      /// ESTATICO
      float a = map(i, -width/2, width/2, -2, 2);
      float b = map(j, -height/2, height/2, -2, 2);

      //float mx = map(mouseX, 0, width, -1.7, 0.85);
      //float my = map(mouseY, 0, height, -1.275, 1.275);

      //float a = map(i, -width/2, width/2, mx-0.3, mx+0.15);
      //float b = map(j, -height/2, height/2, my-0.225, my+0.225);

      float n=0;

      float ca = a;
      float cb = b;

      while (n < nMax)
      {
        float aa = a*a - b*b;
        float bb = 2*a*b;

        /// Mandelbrod Set
        a = aa + ca;
        b = bb + cb;

        /// Julia Set
        //a = aa + desvioX;
        //b = bb + desvioY;

        if (abs(a*a + b*b) > 16)
        {
          break;
        }

        n++;
      }

      //stroke(map(n, 0, nMax, 0, 255));
      stroke(map(n, 0, nMax, 0, 360), 255, 255);
      //stroke(map(n, 0, nMax, 0, 255), map(n, 0, nMax, 0, 255), 92);

      fill(map(n, 0, nMax, 0, 360), 255, 255);

      if (n >= nMax)
      {
        stroke(0);
        fill(0);
      }

      //point(i, j);
      ellipse(i, j, passo, passo);
    }
  }

  fill(0);

  for (int i=-width/2; i<width/2; i += width/4)
  {
    ellipse(i, -width/2 + 5, 3, 3);
    ellipse(i, width/2 - 5, 3, 3);
  }

  for (int j=-height/2; j<height/2; j += height/4)
  {
    ellipse(-height/2 + 5, j, 3, 3);
    ellipse(height/2 - 5, j, 3, 3);
  }

  float a = map(mouseX, 0 , width, -1, 1);
  float b = map(mouseY, 0, height, -1, 1);

  println("Mouse = (" + a + ", " + b + ");");
}