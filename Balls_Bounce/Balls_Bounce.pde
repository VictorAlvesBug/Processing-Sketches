PVector mouse = new PVector(width/3,0); 
/*int numBolas = 1;
int maxBolas = 10;
boolean iniciado = false;*/
int level = 1;
int moving = 2;
// 0 - PARADO
// 1 - MOVENDO
// 2 - INICIO

Bloco[][] bloco = new Bloco[7][9];
Bola[] bola = new Bola[200];
Bola testeBall;
int numBolas = 1;
int maxBolas = 200;

void setup()
{
  size(400, 700);
  background(0);
  
  for(int row=0; row<9; row++)
  {
    for(int col=0; col<7; col++)
    {
      //NONE
      bloco[col][row] = new Bloco(width/14 + col * width/7, width/14 + row * width/7, 0, 'n');
      
      bloco[col][row].update();
      bloco[col][row].draw();
    }
  }
  
  for(int cont=0; cont<maxBolas; cont++)
  {
    bola[cont] = new Bola(width/2, height-15);
  }
  
  bola[0].draw();
  
}

void draw()
{
  background(0);
  
  if(moving == 1) // MOVENDO
  {
    for(int cont=0; cont<numBolas; cont++)
    {
      moving = 2;
      if(bola[cont].movendo)
      {
        moving = 1;
        for(int row=0; row<9; row++)
        {
          for(int col=0; col<7; col++)
          {
            if(bloco[col][row].tipo == 'b')
            {
              if(dist(bloco[col][row].posicao.x, bloco[col][row].posicao.y, bola[cont].posicao.x, bola[cont].posicao.y) <= 15 + (width/14) / cos(atan2(abs(bloco[col][row].posicao.y-bola[cont].posicao.y) , abs(bloco[col][row].posicao.x-bola[cont].posicao.x)))) // cos teta * hip = cat ... hip = cat / cos teta
              {
                bola[cont].velocidade = bloco[col][row].crash(bola[cont]);
                bloco[col][row].valor--;
                bloco[col][row].cor = new PVector(map(bloco[col][row].valor%50, 0, 50, 20, 128), map(bloco[col][row].valor%70, 0, 70, 128, 20), map(bloco[col][row].valor%120, 0, 120, 128, 20));
              }
            }
            else if(bloco[col][row].tipo == 'a')
            {
              numBolas++;
              bloco[col][row].tipo = 'n';
            }
          }
        }
        
        if(bola[cont].posicao.x < 0 || bola[cont].posicao.x > width)
        {
          bola[cont].velocidade.x *= -1;
        }
        
        if(bola[cont].posicao.y < 0)
        {
          bola[cont].velocidade.y *= -1;
        }
        
        bola[cont].update();
        bola[cont].draw();
      }
      else
      {
        bola[cont].movendo = false;
      }
    }
  }
  else if(moving == 2) // INICIO
  {
    level++;
    
    for(int col=0; col<7; col++)
    {
      float rnd = random(1);
        
      if(rnd<0.5)
      {
        //BLOCK
        bloco[col][0] = new Bloco(width/14 + col * width/7, width/14, (int)(random(1,2)*level), 'b');
      }
      else if(rnd<0.75)
      {
        //ADDBALL
        bloco[col][0] = new Bloco(width/14 + col * width/7, width/14, 0, 'a');
      }
      else
      {
        //NONE
        bloco[col][0] = new Bloco(width/14 + col * width/7, width/14, 0, 'n');
      }
    }
    
    for(int row=8; row>0; row--)
    {
      for(int col=0; col<7; col++)
      {
        bloco[col][row].descer(bloco[col][row-1]);
      }
    }
    
    for(int col=0; col<7; col++)
    {
      //NONE
      bloco[col][0] = new Bloco(width/14 + col * width/7, width/14, 0, 'n');
    }
    
    for(int cont=1; cont<numBolas; cont++)
    {
      bola[cont].posicao.x = bola[0].posicao.x;
    }
    
    moving = 0;
  }
  else // PARADO
  {
    for(int row=0; row<9; row++)
    {
      for(int col=0; col<7; col++)
      {
        bloco[col][row].update();
        bloco[col][row].draw();
      }
    }
    
    for(int cont=0; cont<numBolas; cont++)
    {
        bola[cont].draw();
    }
  }
  
  delay(100);
}

void mouseClicked()
{
  if(moving == 0)
  {
    mouse = new PVector(mouseX, mouseY);
    
    for(int cont=0; cont<numBolas; cont++)
    {
      bola[cont].movendo = true;
    }
    
    moving = 1;
  }
}