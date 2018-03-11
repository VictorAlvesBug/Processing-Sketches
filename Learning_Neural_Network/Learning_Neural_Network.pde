int numInputs = 2;
int numHiddens = 5;
int numOutputs = 1;

NeuralNetwork nn = new NeuralNetwork(numInputs, numHiddens, numOutputs);
float[] inputs = new float[numInputs];
float[] testes = new float[numInputs];
float[] targets = new float[numOutputs];

void setup()
{
  surface.setVisible(false);
  //size(800, 800);
  
  /// PORTA LOGICA XOR
  /*for (float x1=0; x1<2; x1++)
  {
    for (float x2=0; x2<2; x2++)
    {
      inputs = new float[]{x1, x2};
      
      float targ = 1;
      
      if(x1 == x2)
      {
        targ = 0;
      }
      
      targets = new float[]{targ};

      nn.train(inputs, targets);
    }
  }
  for (float x1=0; x1<2; x1++)
  {
    for (float x2=0; x2<2; x2++)
    {
      testes = new float[]{x1, x2};
      nn.use(testes);
    }
  }*/

  /// SOMADOR
  for (float x1=0.1; x1<5; x1+=0.5)
  {
    for (float x2=0.1; x2<5; x2+=0.5)
    {
      inputs = new float[]{x1, x2};
      targets = new float[]{(x1+x2)};

      nn.train(inputs, targets);
    }
  }
  for (int x1=1; x1<10; x1+=2)
  {
    for (int x2=1; x2<20; x2+=3)
    {
      testes = new float[]{x1, x2};
      nn.use(testes);
    }
  }
}

void draw()
{
  noLoop();
}