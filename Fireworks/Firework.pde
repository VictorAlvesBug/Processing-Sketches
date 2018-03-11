class Firework
{
 
  PVector cor = new PVector(random(30, 255), random(30, 255), random(30, 255));
  PVector posicao;
  PVector velocidade = new PVector(-20, random(-10, 10));
  int size = 5;
  PVector[] particula = new PVector[50];
  int estado;
  int progressao;
 
  Firework(float x, float y) 
  {
    this.posicao = new PVector(x,y);
  }
 
  void draw() {
    
    stroke(cor.x, cor.y, cor.z);
    
    switch(estado)
    {
      case 0://SUBINDO
        ellipse(posicao.x, posicao.y, size, size);
        posicao.x += velocidade.x;
        posicao.y += velocidade.y;
        velocidade.y += gravidade;
        
        if(velocidade.y <= 0)
        {
          estado++;
        }
        break;
        
      case 1://EXPLODE
        ellipse(posicao.x, posicao.y, size, size);
        
        for(int i=0; i<particula.length; i++)
        {
          float angulo = random(5*PI/6, 13*PI/6);
          float distanciaFoco = random(20, 100);
          particula[i].x = posicao.x + distanciaFoco * cos(angulo);
          particula[i].y = posicao.y + distanciaFoco * sin(angulo);
        }
        break;
        
      case 2://ESPALHANDO E CAINDO
        //partProg.x
        for(int i=0; i<particula.length; i++)
        {
          ellipse(particula[i].x, particula[i].y, size, size);
          particula[i].x += velocidade.x;
          particula[i].y += velocidade.y;
        }
        
        velocidade.y += gravidade;
        
        if(velocidade.y <= 0)
        {
          estado++;
        }
        break;
        
      case 3:
        break;
    }
    
  }
}