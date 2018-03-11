float angRotacao = PI/6, angulo = 0, direcao = 1;
boolean terminado;
int maxIndex=-1;

void setup()
{
  size(800, 800);

  //noCursor();
}

void draw()
{
  background(0);
  translate(width/2, height/2);

  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();

  float lados = 6;

  angRotacao += direcao*0.003;

  if (angRotacao < 0.01)
  {
    direcao = 1;
    angRotacao = 0.01;
  }

  if (angRotacao > TWO_PI/lados-0.01)
  {
    direcao = -1;
    angRotacao = TWO_PI/lados-0.01;
  }

  if (direcao<0)
  {
    //rotate(-angulo);
    angulo += 6*direcao*0.0037;
  } else
  {
    angulo = 0;
  }

  if (lados == 5)
  {
    rotate(-PI/10);
  }

  DesenharForma(0, lados, 350);
}

void DesenharForma(int index, float lados, float raio)
{
  PVector cor1 = new PVector(0, 0, 255);
  PVector cor2 = new PVector(255, 0, 0);
  PVector cor3 = new PVector(0, 255, 0);

  /// GRADIENTE
  /*
  float corR, corG, corB;
   
   corR = map(index, 0, maxIndex, cor1.x, cor2.x);
   corG = map(index, 0, maxIndex, cor1.y, cor2.y);
   corB = map(index, 0, maxIndex, cor1.z, cor2.z);
   fill(corR, corG, corB);
   */

  switch(index%3)
  {
  case 0:
    fill(cor1.x, cor1.y, cor1.z);
    break;

  case 1:
    fill(cor2.x, cor2.y, cor2.z);
    break;

  case 2:
    fill(cor3.x, cor3.y, cor3.z);
    break;
  }

  noStroke();

  beginShape();
  for (float theta=0; theta<TWO_PI; theta += TWO_PI/lados)
  {
    vertex(raio*cos(theta), raio*sin(theta));
  }
  endShape(CLOSE);

  rotate(pow(-1, index) * angRotacao);

  if (raio>2)
  {
    // Angulo do vertice de acordo com o num de lados
    // angVertice = 180 - (360/lados);
    float angVertice = PI - (TWO_PI/lados);

    // LEI DOS SENOS
    // a/sin(A) = b/sin(B) = c/sin(C)
    // raio/sin(180 - angRotacao - angVertice/2) = raioNovo/sin(angVertice/2)
    // raio/sin(PI - angRotacao - angVertice/2) = raioNovo/sin(angVertice/2)
    raio = (raio/sin(PI - (angRotacao%(TWO_PI/lados)) - angVertice/2))*sin(angVertice/2);

    DesenharForma(index+1, lados, raio-1);
  } else
  {
    maxIndex = index;
  }
}