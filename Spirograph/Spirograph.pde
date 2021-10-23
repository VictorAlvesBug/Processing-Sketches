int cont = 0;
float porcentagemRaio = 0.75;

//ArrayList<PVector> ponto = new ArrayList<PVector>();
PVector[] ponto = new PVector[10000];

Circle engrenagemExterior;
Circle engrenagemMedia;
Circle engrenagemInterior;

void setup()
{
  size(800,800);
  float r = 500;
  //                            dentes,  raio  , vel 
  engrenagemExterior = new Circle(r  , 0.01);
  engrenagemMedia = new Circle(r/3  , 0.03);
  engrenagemInterior = new Circle(r/9  , 0.05);
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  
  stroke(0,0,255);
  strokeWeight(2);
  
  engrenagemExterior.draw(0, 0);
  
  engrenagemInterior.update();
  
  engrenagemInterior.anguloRotacao = -engrenagemInterior.anguloTranslacao;
  
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