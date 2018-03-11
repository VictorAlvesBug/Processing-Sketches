color FILL = color(255);
color STROKE = color(0);
color AUXSTROKE = color(0);
int STROKEWEIGHT = 1;
final int pie = 0;
final int open = 1;
final int chord = 2, close = 2;

ArrayList<PVector> VERTEX = new ArrayList<PVector>();

void Background(float rgb)
{
  Background(rgb, rgb, rgb, 255);
}

void Background(float r, float g, float b)
{
  Background(r, g, b, 255);
}

void Background(float r, float g, float b, float a)
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      set(x, y, color((int)r, (int)g, (int)b, (int)a));
    }
  }
}

void Fill(float rgb)
{
  FILL = color(rgb, rgb, rgb, 255);
}

void Fill(float r, float g, float b)
{
  FILL = color(r, g, b, 255);
}

void Fill(float r, float g, float b, float a)
{
  FILL = color((int)r, (int)g, (int)b, (int)a);
}

void NoFill()
{
  FILL = color(0, 0, 0, 0);
}

void Stroke(float rgb)
{
  STROKE = color(rgb, rgb, rgb, 255);
}

void Stroke(float r, float g, float b)
{
  STROKE = color(r, g, b, 255);
}

void Stroke(float r, float g, float b, float a)
{
  STROKE = color((int)r, (int)g, (int)b, (int)a);
}

void NoStroke()
{
  STROKE = color(0, 0, 0, 0);
}

void StrokeWeight(float weight)
{
  STROKEWEIGHT = (int)weight;
}

void Point(float x, float y)
{
  for (float j=y-(STROKEWEIGHT/2.0); j<y+(STROKEWEIGHT/2.0); j++)
  {
    for (float i=x-(STROKEWEIGHT/2.0); i<x+(STROKEWEIGHT/2.0); i++)
    {
      set((int)i, (int)j, STROKE);
    }
  }
}

void Line(float x1, float y1, float x2, float y2)
{
  //hip = STROKEWEIGHT
  // cat/hip = cos(atan2(y2-y1, x2-x1));
  // cat = cos(atan2(y2-y1, x2-x1)) * hip;

  //for (float j=-abs((cos(atan2(-x2+x1, y2-y1)) * STROKEWEIGHT)/2); j<=abs((cos(atan2(-x2+x1, y2-y1)) * STROKEWEIGHT)/2); j++)
  //{
  for (float j=-(STROKEWEIGHT/2.0); j<=(STROKEWEIGHT/2.0); j++)
  {
    for (int i=0; i<1000; i++)
    {
      set((int)map(i, 0, 1000, x1, x2)+(int)j, (int)map(i, 0, 1000, y1, y2)+(int)j, STROKE);
    }
  }

  /// FUNCIONA, MAS DEMORA PRA PROCESSAR
  /*for (int i=0; i<1000; i++)
   {
   for (float j1=-(STROKEWEIGHT/2); j1<=(STROKEWEIGHT/2); j1++)
   {
   for (float j2=-(STROKEWEIGHT/2); j2<=(STROKEWEIGHT/2); j2++)
   {
   set((int)map(i, 0, 1000, x1, x2)+(int)j1, (int)map(i, 0, 1000, y1, y2)+(int)j2, STROKE);
   }
   }
   }*/
}

void Rect(float x1, float y1, float x2, float y2)
{
  for (float y=min(y1, y2); y<max(y1, y2); y++)
  {
    for (float x=min(x1, x2); x<max(x1, x2); x++)
    {
      set((int)x, (int)y, FILL);
    }
  }

  Line(x1, y1, x1, y2);
  Line(x1, y2, x2, y2);
  Line(x2, y2, x2, y1);
  Line(x2, y1, x1, y1);
}

void Ellipse(float cx, float cy, float dx, float dy)
{ 
  for (float y=cy-(dy/2); y<cy+(dy/2); y++)
  {
    float theta = asin(map(y, cy-(dy/2), cy+(dy/2), 1, -1));

    for (float x=cx-(dx/2)*cos(theta); x<cx+(dx/2)*cos(theta); x++)
    {
      set((int)x, (int)y, FILL);
    }
  }

  for (float i=0; i<TWO_PI; i+=0.01)
  {
    Line(cx+(dx/2)*cos(i), cy+(dy/2)*sin(i), cx+(dx/2)*cos(i+0.01), cy+(dy/2)*sin(i+0.01));
  }
}

void Arc(float cx, float cy, float dx, float dy)
{
  Arc(cx, cy, dx, dy, 0, TWO_PI, pie);
}

void Arc(float cx, float cy, float dx, float dy, float ang1, float ang2)
{
  Arc(cx, cy, dx, dy, ang1, ang2, pie);
}

void Arc(float cx, float cy, float dx, float dy, float ang1, float ang2, int type)
{
  AUXSTROKE = STROKE;
  STROKE = FILL;

  if (type == 0)
  {
    // PIE
    for (float i=min(ang1, ang2); i<max(ang1, ang2); i+=0.01)
    {
      Line(cx, cy, cx+(dx/2)*cos(i), cy+(dy/2)*sin(i));
    }
  } else
  {
    // OPEN
    // CHORD
    for (float i=min(ang1, ang2); i<max(ang1, ang2); i+=0.001)
    {
      Line(cx+(dx/2)*cos(ang1), cy+(dy/2)*sin(ang1), cx+(dx/2)*cos(i), cy+(dy/2)*sin(i));
      Line(cx+(dx/2)*cos(ang2), cy+(dy/2)*sin(ang2), cx+(dx/2)*cos(i), cy+(dy/2)*sin(i));
    }
  }

  STROKE = AUXSTROKE;

  for (float i=min(ang1, ang2); i<max(ang1, ang2); i+=0.01)
  {
    Line(cx+(dx/2)*cos(i), cy+(dy/2)*sin(i), cx+(dx/2)*cos(i+0.01), cy+(dy/2)*sin(i+0.01));
  }

  if (type == 2)
  {
    // CHORD
    Line(cx+(dx/2)*cos(ang1), cy+(dy/2)*sin(ang1), cx+(dx/2)*cos(ang2), cy+(dy/2)*sin(ang2));
  }
}

void Triangle(float x1, float y1, float x2, float y2, float x3, float y3)
{
  AUXSTROKE = STROKE;
  STROKE = FILL;

  for (int i=0; i<1000; i++)
  {
    Line(x1, y1, map(i, 0, 1000, x2, x3), map(i, 0, 1000, y2, y3));
  }

  STROKE = AUXSTROKE;

  Line(x1, y1, x2, y2);
  Line(x2, y2, x3, y3);
  Line(x3, y3, x1, y1);
}

void BeginShape()
{
  VERTEX.clear();
}

void Vertex(float x, float y)
{
  VERTEX.add(new PVector(x, y));
}

void EndShape()
{
  EndShape(open);
}

void EndShape(int type)
{
  for (int i=0; i<VERTEX.size()-1; i++)
  {
    Line(VERTEX.get(i).x, VERTEX.get(i).y, VERTEX.get(i+1).x, VERTEX.get(i+1).y);
  }

  if (type == 2) // CLOSE
  {
    Line(VERTEX.get(0).x, VERTEX.get(0).y, VERTEX.get(VERTEX.size()-1).x, VERTEX.get(VERTEX.size()-1).y);
  }

  VERTEX.clear();
}

float Random(float limMax)
{
  return Pow(Sqrt(millis())+1, 2) % limMax;
}

float Random(float limMin, float limMax)
{
  return limMin + Pow(Sqrt(millis())+1, 2) % (limMax-limMin);
}

float Pow(float base, float expoente)
{
  if (expoente == 0)
  {
    return 1;
  } else if (expoente == 1)
  {
    return base;
  }

  float result = 1;
  boolean ExpoenteNegativo = (expoente < 0);

  expoente = abs(expoente);

  if (expoente == int(expoente)) // expoente INTEIRO
  {
    for (int i=0; i<expoente; i++)
    {
      result *= base;
    }
  } else // expoente FRACIONÁRIO
  {
    int[] fracao = geratriz(expoente);

    if (fracao != null)
    {
      int numerador = fracao[0];
      int denominador = fracao[1];

      //          base, grau
      return Raiz(Pow(base, fracao[0]), fracao[1]);
    }
  }

  if (ExpoenteNegativo) // RETORNA O INVERSO DO result DO CASO abs(expoente)
  {
    return 1/result;
  } else
  {
    return result;
  }
}

int[] geratriz(float value)
{
  // a/b = value;
  // numerador/denominador = value;
  // numerador = value*denominador;

  int[] result = {0, 0};
  float maxDenominador = 10000;

  for (int b = 1; b < maxDenominador; b++)
  {
    float a = value*b;

    if (a == int(a)) // numerador INTEIRO
    {
      result[0] = int(a);
      result[1] = b;
      break; // b = int(maxDenominador); /// equivalente a um break do for
    }

    if (a%int(a) < 0.5) // parte decimal
    {
      b = b*2 - 1;
    }
  }

  if (result[0] != 0 && result[1] != 0)
  {
    return result;
  } else
  {
    return null;
  }
}

float Sqrt(float base)
{
  /*
  sqrt(base) = x + e
   base = (x + e)^2
   base = x² + 2*x*e + e²
   base = x² + e*(2*x + e)
   e = (base - x²) / (2*x + e) /// DESPREZA O "e"
   e = (base - x²) / 2*x
   e = (1/2) * (base - x²) / x
   e = (1/2) * (base/x - x²/x)
   e = (1/2) * (base/x - x)
   
   sqrt(base) = x + e
   sqrt(base) = x + (1/2)*(base/x - x)
   sqrt(base) = (1/2)*(2*x) + (1/2)*(base/x - x)
   sqrt(base) = (1/2)*(2*x + base/x - x)
   sqrt(base) = (1/2)*(x + base/x)
   
   FORMULA PARA SE APROXIMAR DA RAIZ EXATA (x É UM CHUTE INICIAL OU APROXIMAÇÃO)
   
   sqrt(base) = (1/2)*(x + base/x)
   */

  float x = 0;

  /// x VAI DE 0 ATE A RAIZ DO QUADRADO PERFEITO IMEDIATAMENTE INFERIOR A base
  while (x*x < base)
  {
    x++;
  }

  if (x*x == base)
  {
    //return x;
  }

  x--;

  x=1;

  for (int i = 0; i < 10; i++)
  {
    /// sqrt(base) = (1/2)*(x + base/x)

    x = (x + base/x)/2;
  }

  return x;
}

float Raiz(float base, float grau)
{
  float num = 0, passo = 1;

  for (int i=0; i<7; i++)
  {
    while (Pow(num, grau) < base)
    {
      num += passo;
    }

    if (Pow(num, grau) == base)
    {
      return num;
    } else
    {
      num -= passo;
      passo /= 10;
    }
  }

  return num;
}