float angulo = 0, velocidadeTerra = 20, divisorSizes;

Sol sol;

Planeta[] planeta;

Satelite lua;

void setup()
{
  //size(1500, 1000);
  fullScreen();
  background(0);
  
  planeta = new Planeta[8];
  
  //-/-/-/-/-/  pos      cor      raio)
  sol = new Sol(0,0 , 255,255,0 ,  695000);//RaioReal = 695000
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)(164*365 + 280)
  planeta[0] = new Planeta(sol.posicao.x+sol.raio+20,0 , sol , 155,127,110 ,  2440*3  ,  velocidadeTerra/88);
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[1] = new Planeta(sol.posicao.x+sol.raio+40,0 , sol , 230,160,83 ,  6052*3  ,  velocidadeTerra/225);
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[2] = new Planeta(sol.posicao.x+sol.raio+90,0 , sol , 30,44,91 ,  6378*3  ,  velocidadeTerra/365);
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[3] = new Planeta(sol.posicao.x+sol.raio+130,0 , sol , 120,50,35 ,  3397*3  ,  velocidadeTerra/(1*365 + 322));
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[4] = new Planeta(sol.posicao.x+sol.raio+200,0 , sol , 214,147,105 ,  71492  ,  velocidadeTerra/(11*365 + 315));
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[5] = new Planeta(sol.posicao.x+sol.raio+300,0 , sol , 130,215,86 ,  60268  ,  velocidadeTerra/(29*365 + 167));
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[6] = new Planeta(sol.posicao.x+sol.raio+400,0 , sol , 110,190,205 ,  25559  ,  velocidadeTerra/(87*365 + 7));
  
  //-/-/-/-/-/-/-/-/   pos                                foco      cor    raio  velocidade)
  planeta[7] = new Planeta(sol.posicao.x+sol.raio+500,0 , sol , 100,145,220 ,  24766  ,  velocidadeTerra/(164*365 + 280));
  
  //-/-/-/-/-/-/-/    pos                                    foco       cor        raio  velocidade)
  lua = new Satelite(planeta[2].posicao.x+planeta[2].raio+5,0 ,  planeta[2] , 220,220,220 ,  1738  ,  -velocidadeTerra);
  
}

void draw()
{
  translate(width/2, height/2);
  background(0);
  
  sol.update();
  sol.draw();
  
  for(int i=0; i<8; i++)
  {
    planeta[i].play();
  }
  
  lua.update();
  lua.draw();
  
  
}