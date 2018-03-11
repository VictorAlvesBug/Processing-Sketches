NeuralNetwork brain;
Matrix matrix = new Matrix(1, 1);
String[] strInput, strOutput;
int cont = 0;


float[][] arrA = { 
  {2, 3}
}; 

float[][] arrB = { 
  {-1, 5}
}; 

float[] arrC;

void setup()
{
  size(800, 800); 

  brain = new NeuralNetwork(2, 5, 1);

  for (int i=0; i<2; i++)
  {
    for (int j=0; j<2; j++)
    {
      float val = 1;

      if (i == j)
      {
        val = 0;
      }

      float[] input = {i, j};
      float[] target = {val};
      brain.train(input, target);

      strInput = new String[input.length];
      strOutput = new String[target.length];
    }
  }

  for (int i=0; i<strInput.length; i++)
  {
    strInput[i] = "";
  }

  for (int i=0; i<strOutput.length; i++)
  {
    strOutput[i] = "";
  }
}

void draw()
{
  background(0);

  for (int i=0; i<strInput.length; i++)
  {
    textSize(40);
    text(strInput[i], 100, 100+50*i);
  }

  for (int i=0; i<strOutput.length; i++)
  {
    textSize(40);
    text(strOutput[i], 200, 100+50*i);
  }
}

void keyPressed()
{
  switch (key)
  {
  case ENTER:
    if (cont>0)
    {
      float[] inp = new float[strInput.length];

      for (int i=0; i<strInput.length; i++)
      {
        inp[i] = float(strInput[i]);
      }

      matrix.fromArray(inp).printMatrix("input");
      println();
      brain.guess(inp).printMatrix("guess");

      float[] output = brain.guess(inp).toArray();

      for (int i=0; i<output.length; i++)
      {
        strOutput[i] = str(output[i]);
      }

      cont = 0;
    } else
    {
      for (int i=0; i<strInput.length; i++)
      {
        strInput[i] = "";
      }
    }

    break;

  case BACKSPACE:
    if (strInput[cont%2].length() > 0)
    {
      strInput[cont%2] = strInput[cont%2].substring(0, strInput[cont%2].length()-1);
    }
    break;

  case ' ':
    if (cont < strInput.length-1 && strInput[0].length() > 0)
    {
      cont++;
    }
    break;

  default:
    strInput[cont%2] += key;
    break;
  }
}

/*void testMatrix()
 {
 arrA = matrix.randomize(arrC);
 matrix.printMatrix(arrA);
 println();
 //matrix.printMatrix(arrC);
 println();
 }*/