int cont = 0;
float velocidadePrincipal = 0.08;
float raioPrincipal = 30;

Gear[] engrenagem = new Gear[5];

void setup()
{
  //size(800,800);
  fullScreen();
  //                      dentes,index
  engrenagem[0] = new Gear(  5 ,  0 );
  engrenagem[1] = new Gear(  10 ,  1 );
  engrenagem[2] = new Gear(  15 ,  2 );
  engrenagem[3] = new Gear(  20 ,  3 );
  engrenagem[4] = new Gear(  25 ,  4 );
  
  engrenagem[0].posicao = new PVector(2*engrenagem[0].raio, height/2);
  
  for(int i=1; i<5; i++)
  {
    float distancia = engrenagem[i-1].raio + engrenagem[i].raio;
    float angulo = 5*PI/3 + (i%2)*PI/3;
    
    engrenagem[i].posicao = new PVector(engrenagem[i-1].posicao.x + distancia * cos(angulo),engrenagem[i-1].posicao.y + distancia * sin(angulo));
  }
}

void draw()
{
  background(0);
  
  for(int i=0; i<5; i++)
  {
    stroke(255,0,0);
    strokeWeight(2);
    engrenagem[i].update();
    engrenagem[i].draw();
  }
  
}