class Letra
{
  ArrayList<PVector> ponto = new ArrayList<PVector>();

  Letra(char caracter)
  {
    switch(caracter)
    {
    case 'A':
      ponto.add(new PVector(0, 120));
      ponto.add(new PVector(40, 0));
      ponto.add(new PVector(60, 0));
      ponto.add(new PVector(100, 120));
      ponto.add(new PVector(80, 120));
      ponto.add(new PVector(70, 70));
      ponto.add(new PVector(30, 70));
      ponto.add(new PVector(20, 120));
      break;

    case 'B':
      break;

    case 'C':
      break;

    case 'D':
      break;

    case 'E':
      break;

    case 'F':
      break;

    case 'G':
      break;

    case 'H':
      break;

    case 'I':
      break;

    case 'J':
      break;

    case 'K':
      break;

    case 'L':
      break;

    case 'M':
      break;

    case 'N':
      break;

    case 'O':
      break;

    case 'P':
      break;

    case 'Q':
      break;

    case 'R':
      break;

    case 'S':
      break;

    case 'T':
      break;

    case 'U':
      break;

    case 'V':
      break;

    case 'W':
      break;

    case 'X':
      break;

    case 'Y':
      break;

    case 'Z':
      break;
    }
  }

  void draw()
  {
    int qtde = ponto.size();

    for (int i=0; i<qtde; i++)
    {
      line(ponto.get(i).x, ponto.get(i).y, ponto.get((i+1)%qtde).x, ponto.get((i+1)%qtde).y);
    }
  }
}