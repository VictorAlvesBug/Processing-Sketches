PVector anterior1, anterior2;
Letra letra = new Letra('A');
float mx, my;
ArrayList<PVector> ponto = new ArrayList<PVector>();
PImage img;
PVector imgPos = new PVector(0, 0);
PVector imgSize = new PVector(708, 792);

void setup()
{
  size(800, 800);
  img = loadImage("Alfabeto.jpg");
  img.resize(1545, 1729);
}

void draw()
{
  background(0);
  //translate(width/2, height/2);


  image(img, imgPos.x, imgPos.y);

  noStroke();
  //letra.draw();

  /*for (int j=0; j<height; j+=30)
   {
   for (int i=0; i<width; i+=30)
   {
   if (i%60 == 0 && j%60 == 0)
   {
   fill(255);
   } else
   {
   fill(128);
   }
   
   ellipse(50+i, 50+j, 5, 5);
   }
   }*/

  stroke(0, 0, 255);
  strokeWeight(10);

  int qtde = ponto.size();

  for (int i=0; i<qtde-1; i++)
  {
    line(ponto.get(i).x, ponto.get(i).y, ponto.get((i+1)%qtde).x, ponto.get((i+1)%qtde).y);
    line(ponto.get(ponto.size()-1).x, ponto.get(ponto.size()-1).y, mouseX, mouseY);
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    ponto.add(new PVector(mouseX, mouseY));
    //print("("+mouseX+", "+mouseY+"), ");
  }

  /*if (mouseButton == RIGHT)
   {
   ponto.remove(ponto.size()-1);
   }*/
}

void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    mx = mouseX - imgPos.x;
    my = mouseY - imgPos.y;
  }
}

void mouseDragged() 
{
  if (mouseButton == RIGHT)
  {
    imgPos = new PVector(mouseX - mx, mouseY - my);
  }
}

/*void mouseWheel(MouseEvent event) 
 {
 float e = event.getAmount();
 if (e<0) // ZOOM OUT 
 {
 imgSize.x /= 1.05;
 imgSize.y /= 1.05;
 img.resize((int)imgSize.x, (int)imgSize.y);
 }
 
 if (e>0) // ZOOM IN
 {
 imgSize.x *= 1.05;
 imgSize.y *= 1.05;
 img.resize((int)imgSize.x, (int)imgSize.y);
 }
 println(imgSize.x+", "+imgSize.y);
 }*/

void keyPressed()
{
  if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z'))
  {
    int qtde = ponto.size();

    for (int i=0; i<qtde; i++)
    {
      print("(" + ponto.get(i).x + ", " + ponto.get(i).y + "), ");
    }

    ponto.clear();

    println("");
    println("");
    print(key + " = ");
  }

  if (key == BACKSPACE)
  {
    ponto.remove(ponto.size()-1);
  }
}
/*todos[i] = new ArrayList(); 
 ArrayList[] PONTO = new ArrayList[2];
 
 for(int i = 0; i< maxCol;i++){
 for(int x = 0; x< maxRow;x++){
 blocks[i].add(new Block(width/2+i*25, height/2+x*25, blocksize, int(random(0,2)), true));
 }
 } */


ArrayList<PVector> PONTO = new ArrayList<PVector>();

ArrayList<PVector> A = new ArrayList<PVector>();
ArrayList<PVector> B = new ArrayList<PVector>();
ArrayList<PVector> C = new ArrayList<PVector>();
ArrayList<PVector> D = new ArrayList<PVector>();
ArrayList<PVector> E = new ArrayList<PVector>();
ArrayList<PVector> F = new ArrayList<PVector>();
ArrayList<PVector> G = new ArrayList<PVector>();
ArrayList<PVector> H = new ArrayList<PVector>();
ArrayList<PVector> I = new ArrayList<PVector>();
ArrayList<PVector> J = new ArrayList<PVector>();
ArrayList<PVector> K = new ArrayList<PVector>();
ArrayList<PVector> L = new ArrayList<PVector>();
ArrayList<PVector> M = new ArrayList<PVector>();
ArrayList<PVector> N = new ArrayList<PVector>();
ArrayList<PVector> O = new ArrayList<PVector>();
ArrayList<PVector> P = new ArrayList<PVector>();
ArrayList<PVector> Q = new ArrayList<PVector>();
ArrayList<PVector> R = new ArrayList<PVector>();
ArrayList<PVector> S = new ArrayList<PVector>();
ArrayList<PVector> T = new ArrayList<PVector>();
ArrayList<PVector> U = new ArrayList<PVector>();
ArrayList<PVector> V = new ArrayList<PVector>();
ArrayList<PVector> W = new ArrayList<PVector>();
ArrayList<PVector> X = new ArrayList<PVector>();
ArrayList<PVector> Y = new ArrayList<PVector>();
ArrayList<PVector> Z = new ArrayList<PVector>();

ArrayList<String> LISTA = new ArrayList<String>();
//PONTO = new ArrayList<PVector>[26];
//PVector[] p = new PVector[26];

void CoordenadasParaArrayDePontos(String texto)
{
  //LISTA.add("");
  String lista = "";

  for (int i=0; i<texto.length(); i++)
  {
    if (texto.charAt(i) != '#')
    {
      lista += texto.charAt(i);
    } else
    {
      LISTA.add(lista);
      lista = "";
    }
  }

  for (int cont=0; cont<26; cont++)
  {
    LISTA.get(cont).replace(LISTA.get(cont).substring(0, 5), "");


    for (int i=0; i<LISTA.get(cont).length(); i++)
    {
      String[] num = new String[2];
      int contador = 0;
      num[0] = "";
      num[1] = "";

      if (LISTA.get(cont).charAt(i) >= '0' && LISTA.get(cont).charAt(i) <= '9')
      {
        num[contador] += LISTA.get(cont).charAt(i);
      } else
      {
        if (contador == 0)
        {
          contador++;
        } else
        {
          contador = 0;

          PONTO.add(new PVector(Integer.parseInt(num[0]), Integer.parseInt(num[1])));
        }
      }

      float minX = 1000;
      float minY = 1000;

      for (int j=0; j<PONTO.size(); j++)
      {
        if (minX > PONTO.get(j).x)
        {
          minX = PONTO.get(j).x;
        }

        if (minY > PONTO.get(j).y)
        {
          minY = PONTO.get(j).y;
        }
      }

      for (int j=0; j<PONTO.size(); j++)
      {
        PONTO.get(j).x -= minX;
        PONTO.get(j).y -= minY;
      }

      switch(cont)
      {
      case 0:
        A = PONTO;
        break;

      case 1:
        B = PONTO;
        break;

      case 2:
        C = PONTO;
        break;

      case 3:
        D = PONTO;
        break;

      case 4:
        E = PONTO;
        break;

      case 5:
        F = PONTO;
        break;

      case 6:
        G = PONTO;
        break;

      case 7:
        H = PONTO;
        break;

      case 8:
        I = PONTO;
        break;

      case 9:
        J = PONTO;
        break;

      case 10:
        K = PONTO;
        break;

      case 11:
        L = PONTO;
        break;

      case 12:
        M = PONTO;
        break;

      case 13:
        N = PONTO;
        break;

      case 14:
        O = PONTO;
        break;

      case 15:
        P = PONTO;
        break;

      case 16:
        Q = PONTO;
        break;

      case 17:
        R = PONTO;
        break;

      case 18:
        S = PONTO;
        break;

      case 19:
        T = PONTO;
        break;

      case 20:
        U = PONTO;
        break;

      case 21:
        V = PONTO;
        break;

      case 22:
        W = PONTO;
        break;

      case 23:
        X = PONTO;
        break;

      case 24:
        Y = PONTO;
        break;

      case 25:
        Z = PONTO;
        break;
      }
    }
  }
}