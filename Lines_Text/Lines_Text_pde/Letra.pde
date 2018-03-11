class Letra
{
  ArrayList<PVector> ponto = new ArrayList<PVector>();
  char character;

  Letra(char caracter)
  {
    this.character = caracter;
  }

  void draw()
  {
    switch(character)
      {
      case 'A':
        ponto = A;
        break;
        
      case 'B':
        ponto = B;
        break;
        
      case 'C':
        ponto = C;
        break;
        
      case 'D':
        ponto = D;
        break;
        
      case 'E':
        ponto = E;
        break;
        
      case 'F':
        ponto = F;
        break;
        
      case 'G':
        ponto = G;
        break;
        
      case 'H':
        ponto = H;
        break;
        
      case 'I':
        ponto = I;
        break;
        
      case 'J':
        ponto = J;
        break;
        
      case 'K':
        ponto = K;
        break;
        
      case 'L':
        ponto = L;
        break;
        
      case 'M':
        ponto = M;
        break;
        
      case 'N':
        ponto = N;
        break;
        
      case 'O':
        ponto = O;
        break;
        
      case 'P':
        ponto = P;
        break;
        
      case 'Q':
        ponto = Q;
        break;
        
      case 'R':
        ponto = R;
        break;
        
      case 'S':
        ponto = S;
        break;
        
      case 'T':
        ponto = T;
        break;
        
      case 'U':
        ponto = U;
        break;
        
      case 'V':
        ponto = V;
        break;
        
      case 'W':
        ponto = W;
        break;
        
      case 'X':
        ponto = X;
        break;
        
      case 'Y':
        ponto = Y;
        break;
        
      case 'Z':
        ponto = Z;
        break;
      }
    
    //println(ponto.get(0).x+ponto.get(0).y);
    
    int qtde = ponto.size();

    for (int i=0; i<qtde; i++)
    {
      stroke(255);
      point(ponto.get(i).x, ponto.get(i).y);
      //line(ponto.get(i).x, ponto.get(i).y, ponto.get((i+1)%qtde).x, ponto.get((i+1)%qtde).y);
    }
  }
}