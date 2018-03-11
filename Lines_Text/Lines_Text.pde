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
ArrayList<String> LISTA = new ArrayList<String>();
//PONTO = new ArrayList<PVector>[26];
//PVector[] p = new PVector[26];

void CoordenadasParaArrayDePontos(String texto)
{
  //LISTA.add("");
  String lista = "";

  for (int i; i<texto.length(); i++)
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
    LISTA.get(cont).replace(LISTA.get(cont).substring(0, 5),"");
    
    
    for (int i; i<LISTA.get(cont).length(); i++)
    {
      String[] num = new String[2];
      int contador = 0;
      num[0] = "";
      num[1] = "";
      
      if(LISTA.get(cont).charAt(i) >= '0' && LISTA.get(cont).charAt(i) <= '9')
      {
        num[contador] += LISTA.get(cont).charAt(i);
      }
      else
      {
        if(contador == 0)
        {
          contador++;
        }
        else
        {
          contador = 0;
          
          PONTO.add(new PVector((int)num[0], (int)num[1]));
        }
      }
      PONTO.add(new PVectorLISTA.get(cont));
    }

    PONTO.add(new PVectorLISTA.get(cont));
    p[cont] = new PVector();
  }
}