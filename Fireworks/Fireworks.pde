int index = 0;
int switcher=0;

float[] posX;
float[] posY;
float[] vel;
int[] status;
int[] scale;
float[][] particulaX;
float[][] particulaY;

int[] corR;
int[] corG;
int[] corB;

int maxBolas = 100;
int maxBolasSetadas = 0;
int numParticulas = 20;
float gravidade = 1;

void setup()
{
  size(1800, 1000);
  //colorMode(HSB);
  
  posX = new float[maxBolas];
  posY = new float[maxBolas];
  vel = new float[maxBolas];
  status = new int[maxBolas];
  scale = new int[maxBolas];
  particulaX = new float[maxBolas][numParticulas];
  particulaY = new float[maxBolas][numParticulas];
  
  corR = new int[maxBolas];
  corG = new int[maxBolas];
  corB = new int[maxBolas];
  
  for(int i=0; i<maxBolas; i++)
  {
    status[i] = 0;
  }
}

void draw()
{
  background(0);
  stroke(0, 0, 255);
  
  if(switcher%3==0)
  {
    posX[index] = random(0, width);
    posY[index] = random(height, 2*height);
    vel[index] = 23;
    status[index] = 0;
    scale[index] = 0;
    
    corR[index] = (int)random(255);
    corG[index] = (int)random(255);
    corB[index] = (int)random(255);
    
    index++;
    
    if(index>=maxBolas)
    {
      index = 0;
    }
    
    if(index>maxBolasSetadas)
    {
      maxBolasSetadas = index;
    }
  }
  
  switcher++;
  
  for(int i=0; i<maxBolasSetadas; i++)
  {
    stroke(corR[i], corG[i], corB[i]);    
    
    if(status[i] == 0)
    {
      ellipse(posX[i], posY[i], 5, 5);
      
      if(vel[i]<=0)
      {
          status[i] = 1;
          for(int p=0; p<numParticulas; p++)
          {
              particulaX[i][p] = posX[i] + random(50)*cos(random(TWO_PI));
              particulaY[i][p] = posY[i] + random(50)*sin(random(TWO_PI));
          }
      }
      
      posY[i] -= vel[i];
      vel[i]-=0.3;
    }
    else if(status[i] == 1) // EXPLODING
    {
      for(int p=0; p<numParticulas; p++)
      {
        float partPosX = map(scale[i], 0, 20, posX[i], particulaX[i][p]);
        float partPosY = map(scale[i], 0, 20, posY[i], particulaY[i][p]);
        
        ellipse(partPosX, partPosY, map(scale[i], 0, 20, 3, 0), map(scale[i], 0, 20, 3, 0));
        particulaY[i][p] -= vel[i];
      }
      
      vel[i]-=0.3;
      
      if(scale[i]>=20)
      {
        status[i] = 2;
      }
      
      scale[i]++;
      
    }
    else
    {
      
    }
  }
  
  delay(10);
}