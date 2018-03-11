int cont = 0;
float porcentagemRaio = 0.75;

//ArrayList<PVector> ponto = new ArrayList<PVector>();
PVector[] ponto = new PVector[10000];

Gear engrenagemExterior;
Gear engrenagemInterior;

void setup()
{
  size(800,800);
  
  //                            dentes,  raio  , vel 
  engrenagemExterior = new Gear(  100 ,   700  , 0.01);
  engrenagemInterior = new Gear(   45 ,   45*7  , 0.05);
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  
  stroke(0,0,255);
  strokeWeight(2);
  
  engrenagemExterior.draw(0, 0);
  
  engrenagemInterior.update();
  
  engrenagemInterior.anguloRotacao = -engrenagemInterior.anguloTranslacao * (engrenagemExterior.dentes / engrenagemInterior.dentes - 1);
  
  float raio = engrenagemExterior.raio-engrenagemInterior.raio;
  
  engrenagemInterior.draw(raio*cos(engrenagemInterior.anguloTranslacao), raio*sin(engrenagemInterior.anguloTranslacao));
  
  engrenagemInterior.addPonto(raio*cos(engrenagemInterior.anguloTranslacao), raio*sin(engrenagemInterior.anguloTranslacao));
  
  if(cont > 9999)
  {
    cont = 0;
  }
  
  noFill();
  stroke(255,0,0);
  strokeWeight(3);
  
  for(int i=1; i<cont; i++)
  {
    line(ponto[i-1].x, ponto[i-1].y, ponto[i].x, ponto[i].y);
  }
  
}